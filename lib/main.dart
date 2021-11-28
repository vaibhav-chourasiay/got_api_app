import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:gameofthrones/details.dart';
import 'package:gameofthrones/gotmodels.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Game of Thrones",
      theme: ThemeData.dark(),
      routes: {
        "/": (context) => const HomePage(),
      },
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var url =
      "http://api.tvmaze.com/singlesearch/shows?q=game%20of%20thrones%20&embed=episodes";
  @override
  void initState() {
    super.initState();
    getdata();
  }

  getdata() async {
    var res = await Dio().get(url);
    // print(res.data["_embedded"]);
    var data = res.data["_embedded"];

    Got.putlist(data["episodes"]);

    // print(res.data.runtimeType);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  "assets/background.jpg",
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: double.infinity,
                  height: 52,
                  margin: const EdgeInsets.symmetric(
                    horizontal: 10.0,
                    vertical: 5.0,
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 25.0,
                  ),
                  alignment: Alignment.center,
                  child: Image.asset(
                    "assets/text.png",
                  ),
                  decoration: BoxDecoration(
                    color: HexColor("#ececec"),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15.0,
                    vertical: 10.0,
                  ),
                  decoration: BoxDecoration(
                    color: HexColor(
                      "#ececec",
                    ),
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20.0),
                      topRight: Radius.circular(20.0),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Text(
                              "Nine noble families wage war against each other in order to gain control over the mythical land of Westeros. Meanwhile, a force is rising after millenniums and threatens the existence of living men.",
                              style: GoogleFonts.cinzel(
                                color: Colors.black,
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DetailPage(),
                            ),
                          );
                        },
                        child: const Text("See All"),
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                              Colors.black,
                            ),
                            shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ))),
                      ),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
