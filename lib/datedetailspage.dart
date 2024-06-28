import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'calendar.dart'; // Assuming this is your calendar widget
import 'day.dart'; // Assuming this is your Day data class
import 'package:intl/intl.dart';
import 'pastjournalentry.dart';

class DateDetailsPage extends StatefulWidget {
  final Day day;

  const DateDetailsPage({Key? key, required this.day}) : super(key: key);

  @override
  State<DateDetailsPage> createState() => _DateDetailsPageState();
}

class _DateDetailsPageState extends State<DateDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            height: double.infinity,
            width: double.infinity,
            color: const Color(0xFFFFFCF2),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 45.0, left:30.0, right: 30),
            child: Column(
              children: <Widget>[
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Wrap(
                      children: [
                        Text(
                          '${DateFormat('E, MMM d, yyyy').format(DateTime(widget.day.year, widget.day.month, widget.day.date))}:',
                          style: GoogleFonts.rubik(
                            fontSize: 35.0,
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.w400,
                            color: const Color(0xFF110340),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Container(
              child: Expanded(
                  child: ListView (
                    children: [
                      GestureDetector(
                        onTap: () {
                          print('container tapped for day: ${widget.day.date}');
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => PastJournalEntryPage(day: widget.day),
                            ),
                          );
                        },
                        child: Container(
                          height:175,
                          decoration: BoxDecoration(
                            color: const Color(0xFFFFB12B),
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          child: Stack(
                            children: [
                              Align(
                                alignment: Alignment.bottomLeft,
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Text(
                                    '12:12',
                                    style: GoogleFonts.rubik(
                                      fontSize: 90,
                                      color: const Color(0xFFFFFCF2),
                                      height: 0.9,
                                    ),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.bottomRight,
                                child: Text(
                                  'AM',
                                  style: GoogleFonts.rubik(
                                    fontSize: 190,
                                    color: const Color(0xFFFFFCF2).withOpacity(0.25),
                                    height: 0.9,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                          height: 20
                      ),
                      GestureDetector(
                        onTap: () {
                          print('container tapped for day: ${widget.day.date}');
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => PastJournalEntryPage(day: widget.day),
                            ),
                          );
                        },
                        child: Container(
                          height:175,
                          decoration: BoxDecoration(
                            color: const Color(0xFFFFB12B),
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          child: Stack(
                            children: [
                              Align(
                                alignment: Alignment.bottomLeft,
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Text(
                                    '12:12',
                                    style: GoogleFonts.rubik(
                                      fontSize: 90,
                                      color: const Color(0xFFFFFCF2),
                                      height: 0.9,
                                    ),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.bottomRight,
                                child: Text(
                                  'AM',
                                  style: GoogleFonts.rubik(
                                    fontSize: 190,
                                    color: const Color(0xFFFFFCF2).withOpacity(0.25),
                                    height: 0.9,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ]
                  )
              )
                )
              ],
            ),
          )
        ]
      )
    );
  }
}
