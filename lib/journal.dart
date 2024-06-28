import 'package:flutter/material.dart';
import 'package:theproject1/calendardisplay.dart';
import 'calendar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'day.dart';
import 'package:theproject1/auth_service.dart';

class JournalPage extends StatefulWidget {
  final Day? day;

  const JournalPage({super.key, this.day});

  @override
  State<JournalPage> createState() => _JournalPageState();
}

class _JournalPageState extends State<JournalPage> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(
        children: <Widget>[
        Container(
          height: double.infinity,
          width: double.infinity,
          color: const Color(0xFFFFFCF2),
        ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
                Padding(
                  padding: const EdgeInsets.only(top: 25.0, right: 15.0, left: 15.0),
                  child: Text(
                    '${DateFormat('M').format(DateTime.now())}/${DateFormat('d').format(DateTime.now())}/${DateFormat('y').format(DateTime.now())}:',
                    style: GoogleFonts.rubik(
                      fontStyle: FontStyle.italic,
                      fontSize: 30,
                      color: const Color(0xFF482BAD),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top:25.0, right: 15.0),
                  child: IconButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const CalendarDisplayPage(),
                          )
                      );
                    },
                    icon: const Icon(Icons.close, size:50,color: Color(0xFFFFDE59)),
                  ),
                ),
              ]
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding (
                  padding:const EdgeInsets.only(top:75.0,right:5.0,left:15.0),
                  child: Text(
                    'Hey,',
                    style: GoogleFonts.rubik (
                      fontSize: 75,
                      color: const Color(0xFFFFDE59),
                    ),
                  )
              ),
              Padding (
                  padding:const EdgeInsets.only(top:75.0,right:15.0),
                  child: Text(
                    'Name',
                    style: GoogleFonts.rubik (
                      fontWeight: FontWeight.bold,
                      fontSize: 75,
                      color: Color(0xFFFFB12B),
                    ),
                  )
              ),
            ]
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(top:160.0, right:15),
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.zero,
                    backgroundColor: const Color(0xFFD38BF5),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(5.0),
                    child: Text(
                      'click here to get a prompt',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontFamily: 'Rubik',
                        fontSize: 18,
                        color: Color(0xFFFFFCF2),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const Padding(
            padding: const EdgeInsets.only(top: 165.0, right: 16.0, left: 16.0),
            child: TextField(
              decoration: InputDecoration(
                filled: true,
                fillColor: const Color(0xFFFFF6D4),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: const Color(0xFFFFB12B), width: 2),
                ),
                hintText: 'Start typing...', // Placeholder text
              ),
              maxLines: 20,
              minLines: 20,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 765.0, right: 16.0, left: 16.0, bottom:16),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.zero,
                  backgroundColor: Color(0xFF482BAD),
                ),
                child: Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                    'SUBMIT',
                    maxLines: 1,
                    style: GoogleFonts.rubik(
                      fontSize: 40,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xFFFFFCF2),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ]
      ),
    );
  }
}