import 'package:flutter/material.dart';
import 'package:theproject1/calendardisplay.dart';
import 'calendar.dart';
import 'package:google_fonts/google_fonts.dart';

class JournalPage extends StatelessWidget {
  const JournalPage({super.key});

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
          Padding (
            padding:const EdgeInsets.only(top:35.0,right:16.0,left:16.0),
            child: Text(
                  'date',
                style: GoogleFonts.rubik(
                fontSize: 30,
                color: const Color(0xFFFFDE59),
              ),
              )
            ),
          Padding(
            padding: const EdgeInsets.only(top: 20.0, right: 16.0, left: 330.0),
            child: IconButton(
              onPressed: () {
                    Navigator.push(
                      context,
                        MaterialPageRoute(
                          builder: (context) => const CalendarDisplayPage(),
                        )
                    );
                },
              icon: const Icon(Icons.close, size:45,color: Color(0xFFFFDE59)),
            ),
          ),
          Padding (
            padding:const EdgeInsets.only(top:60.0,right:16.0,left:16.0),
            child: Text(
                  'Hey,',
                  style: GoogleFonts.rubik (
                    fontSize: 75,
                    color: const Color(0xFFFFDE59),
                  ),
                )
            ),
          Padding (
              padding:const EdgeInsets.only(top:60.0,right:16.0,left:160.0),
              child: Text(
                'Name!',
                style: GoogleFonts.rubik (
                  fontWeight: FontWeight.bold,
                  fontSize: 75,
                  color: Color(0xFFFFB12B),
                ),
              )
          ),
          Padding (
            padding:const EdgeInsets.only(top:165.0,right:16.0,left:16.0),
            child: Opacity (
                opacity:0.55,
              child: Text(
                'start typing',
                style: GoogleFonts.rubik (
                  fontSize: 22,
                  color: Color(0xFFD38BF5),
                )
              ),
            ),
          ),
          Padding (
            padding:const EdgeInsets.only(top:165.0,right:16.0,left:145.0),
            child: Opacity (
              opacity:0.55,
              child: Text(
                'or',
                style: GoogleFonts.rubik(
                  fontSize: 22,
                  color: const Color(0xFFFFB12B),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 160.0, right: 5, left: 170.0),
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
          const Padding (
            padding: EdgeInsets.only(top:215,right:16,left:16),
                child: TextField(
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Color (0xFFFFF6D4),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFFFFB12B), width: 2),
                        ),
                      ),
                      minLines: 20,
                      maxLines: 20,
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