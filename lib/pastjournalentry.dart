import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'day.dart';

class PastJournalEntryPage extends StatefulWidget {
  final Day day;

  const PastJournalEntryPage({Key? key, required this.day}) : super(key:key);

  @override
  State<PastJournalEntryPage> createState() => _PastJournalEntryPage();
}

class _PastJournalEntryPage extends State<PastJournalEntryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack (
        children:[
          Container(
            color: const Color(0xFFFFFCF2),
          ),
          Padding(
            padding: EdgeInsets.only(top: 25, left:15.0, right:15.0),
            child: FractionallySizedBox(
              heightFactor: 0.3,
              widthFactor: 0.7,
              alignment: FractionalOffset.topRight,
              child: Stack(
                children: [
                  Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${DateFormat('EEEE').format(DateTime(widget.day.year, widget.day.month, widget.day.date))},${widget.day.date} ${DateFormat('MMMM').format(DateTime(widget.day.year, widget.day.month, widget.day.date))}:',
                        style: GoogleFonts.rubik(
                          fontSize: 20.0,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.w400,
                          color: const Color(0xFF110340),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: const Color(0xFFFFB12B),
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(5.0),
                          child: Text(
                            "mood",
                            style: GoogleFonts.rubik(
                              fontSize: 25,
                              color: const Color(0xFFFFFCF2),
                              height: 0.9,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                ],
              ),
            ),
          ),

          Column (
              children: <Widget>[
                Padding (
                  padding: EdgeInsets.only (top: 100.0, left:15.0, right:15.0),
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: Text(
                      "HI, i am very happy and nice. i like the color pink. ",
                      style: GoogleFonts.rubik(
                        fontSize: 25,
                        color: const Color(0xFF482BAD),
                        height: 0.9,
                      ),
                    ),
                  ),
                )
              ]
          )
        ]
      ),
    );

  }
}