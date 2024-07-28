import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'day.dart';

class PastJournalEntryPage extends StatefulWidget {
  final Day day;

  const PastJournalEntryPage({Key? key, required this.day}) : super(key: key);

  @override
  State<PastJournalEntryPage> createState() => _PastJournalEntryPageState();
}

class _PastJournalEntryPageState extends State<PastJournalEntryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding (
          padding: const EdgeInsets.all(15.0),
          child: Container(
            color: const Color(0xFFFFFCF2),
            margin: const EdgeInsets.all(15.0),
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '${DateFormat('EEEE').format(DateTime(widget.day.year, widget.day.month, widget.day.date))}, ${widget.day.date} ${DateFormat('MMMM').format(DateTime(widget.day.year, widget.day.month, widget.day.date))}',
                      style: GoogleFonts.rubik(
                        fontSize: 40.0,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.w400,
                        color: const Color(0xFF110340),
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
                const SizedBox(height: 20.0),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                  decoration: BoxDecoration(
                    color: const Color(0xFFFFB12B),
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  child: Text(
                    "Mood",
                    style: GoogleFonts.rubik(
                      fontSize: 35,
                      color: const Color(0xFFFFFCF2),
                      height: 1,
                    ),
                  ),
                ),
                const SizedBox(height: 20.0),
                Expanded(
                  child: SingleChildScrollView(
                    child: Container(
                      padding: const EdgeInsets.all(20.0),
                      decoration: BoxDecoration(
                        color: const Color(0xFFFFF6D4),
                        borderRadius: BorderRadius.circular(20.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.3),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Text(
                        'HI, I am very happy and nice. I like the color pink.',
                        style: GoogleFonts.rubik(
                          fontSize: 25,
                          color: const Color(0xFF482BAD),
                          height: 1.5,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
      ),
    );
  }
}