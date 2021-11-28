// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:gameofthrones/gotmodels.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailPage extends StatefulWidget {
  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  showSummary(index) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            title: const Text("Summary :"),
            content: Row(
              children: [
                Expanded(
                    child: Text(Got.episodes[index]["summary"].toString())),
              ],
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        title: Text(
          "All Episodes",
          style: GoogleFonts.cinzel(
            fontSize: 26.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 10.0,
              crossAxisSpacing: 10.0,
            ),
            itemBuilder: (context, index) {
              return Stack(children: [
                GestureDetector(
                  onTap: () {
                    showSummary(index);
                  },
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    elevation: 40.0,
                    child: Container(
                      padding: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(
                            Got.episodes[index]["image"]["medium"],
                          ),
                          fit: BoxFit.cover,
                        ),
                        border: Border.all(
                          width: 2.0,
                          color: Colors.white,
                        ),
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      alignment: Alignment.bottomCenter,
                      child: Text(
                        Got.episodes[index]["name"],
                        style: GoogleFonts.cinzel(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 7.0,
                  left: 7.0,
                  child: Container(
                    padding: const EdgeInsets.all(
                      10.0,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.redAccent,
                    ),
                    child: Text(
                      Got.episodes[index]["rating"]["average"].toString(),
                    ),
                  ),
                )
              ]);
            },
            itemCount: Got.episodes.length,
          ),
        ),
      ),
    );
  }
}
