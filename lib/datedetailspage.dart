import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'database_service.dart';
import 'day.dart';
import 'journalentry.dart';
import 'pastjournalentry.dart';
import 'journal.dart';

class DateDetailsPage extends StatefulWidget {
  final Day day;

  const DateDetailsPage({Key? key, required this.day}) : super(key: key);

  @override
  State<DateDetailsPage> createState() => _DateDetailsPageState();
}

class _DateDetailsPageState extends State<DateDetailsPage> {
  final _dbServivce = DatabaseService();
  DateTime todayDate = DateTime(widget.day.year, widget.day.month, widget.day.date);

  Future<List<JournalEntry>> todayEntries = _dbServivce.getJournalEntriesByDate(todayDate);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Stack(
          children: <Widget>[
            Container(
              height: double.infinity,
              width: double.infinity,
              color: const Color(0xFFFFFCF2),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          '${DateFormat('E, MMM d, yyyy').format(DateTime(widget.day.year, widget.day.month, widget.day.date))}:',
                          style: GoogleFonts.rubik(
                            fontSize: 35.0,
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.w400,
                            color: const Color(0xFF110340),
                          ),
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.close, size: 40, color: const Color(0xFFFFB12B)),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Expanded(
                    child: ListView(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => PastJournalEntryPage(day: widget.day),
                              ),
                            );
                          },
                          child: Container(
                            height: 175,
                            margin: const EdgeInsets.only(bottom: 20),
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
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => PastJournalEntryPage(day: widget.day),
                              ),
                            );
                          },
                          child: Container(
                            height: 175,
                            margin: const EdgeInsets.only(bottom: 20),
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
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => JournalPage(),
                              ),
                            );
                          },
                          child: Container(
                            height: 175,
                            decoration: BoxDecoration(
                              color: const Color(0xFF482BAD),
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                            child: Center(
                              child: Icon(
                                Icons.add,
                                size: 50,
                                color: const Color(0xFFFFFCF2),
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
          ],
        ),
      ),
    );
  }
}
