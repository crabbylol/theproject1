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
            padding: EdgeInsets.only(top: 45, left:15.0, right:15.0),
            child: Column(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${DateFormat('EEEE').format(DateTime(widget.day.year, widget.day.month, widget.day.date))},${widget.day.date} ${DateFormat('MMMM').format(DateTime(widget.day.year, widget.day.month, widget.day.date))}:',
                      style: GoogleFonts.rubik(
                        fontSize: 40.0,
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
                        padding: const EdgeInsets.all(5.0),
                        child: Text(
                          "Mood",
                          style: GoogleFonts.rubik(
                            fontSize: 35,
                            color: const Color(0xFFFFFCF2),
                            height: 1,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20.0,),
                    Text (
                      'HI, i am very happy and nice. i like the color pink',
                        style: GoogleFonts.rubik(
                          fontSize: 25,
                          color: const Color(0xFF482BAD),
                          height: 0.9,
                        )
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );

  }
}