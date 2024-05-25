import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'datedetailspage.dart';
import 'day.dart';

class CalendarPage extends StatefulWidget {
  final int initialYear;
  final int initialMonth;

  const CalendarPage({Key? key, required this.initialYear, required this.initialMonth}) : super(key: key);

  @override
  State<CalendarPage> createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  int year = 0;
  int month = 0;

  @override
  void initState() {
    super.initState();
    year = widget.initialYear;
    month = widget.initialMonth;
  }

  @override
  Widget build(BuildContext context) {
    List<Day> daysInMonth = _generateDaysInMonth(year, month);
    List<String> dayNames = ['MON', 'TUE', 'WED', 'THU', 'FRI', 'SAT', 'SUN'];

    final firstDay = DateTime(year, month, 1);
    final weekdayOffset = (firstDay.weekday - DateTime.monday) % 7;

    return Scaffold(
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(left:8.0, right:8.0, top:30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 25.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      IconButton(
                        onPressed: () {
                          setState(() {
                            month--;
                            if (month == 0) {
                              month = 12;
                              year--;
                            }
                          });
                        },
                        icon: const Icon(
                          Icons.arrow_back_ios_rounded,
                          color: Color(0xFFFFB12B),
                          size: 30.0,
                        ),
                      ),
                      Text(
                        '${_getMonthName(month)} $year',
                        style: GoogleFonts.rubik(
                          color: const Color(0xFF482BAD),
                          fontWeight: FontWeight.w800,
                          fontSize: 20,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          setState(() {
                            month++;
                            if (month == 13) {
                              month = 1;
                              year++;
                            }
                          });
                        },
                        icon: const Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: Color(0xFFFFB12B),
                          size: 30.0,
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: List.generate(
                    7,
                        (index) => Text(
                      dayNames[index],
                      style: GoogleFonts.rubik(
                        fontWeight: FontWeight.w400,
                        color: const Color(0xFF110340),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left:8.0, right:8.0, top: 2.0),
                    child: GridView.builder(
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 7,
                      ),
                      itemCount: daysInMonth.length + weekdayOffset,
                      itemBuilder: (BuildContext context, int index) {
                        if (index < weekdayOffset) {
                          return const Text(' ');
                        }
                        final day = daysInMonth[index - weekdayOffset];
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => DateDetailsPage(day: day)),
                            );
                          },
                          child: Align(
                            alignment: Alignment.center,
                            child: Text('${day.date}'),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 165,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Starry Spectrum',
                    style: GoogleFonts.rubik(
                      fontSize: 25,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xFF482BAD),
                    ),
                  ),
                  SizedBox (
                    height:20
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          color: Colors.red,
                          width: 100.0,
                          height: 100.0,
                        ),
                        Container(

                          color: Colors.green,
                          width: 100.0,
                          height: 100.0,
                        ),
                        Container(

                          color: Colors.blue,
                          width: 100.0,
                          height: 100.0,
                        ),
                      ],
                    ),

                ],
            )
    ),
      ],
      )
    );
  }

  List<Day> _generateDaysInMonth(int year, int month) {
    List<Day> days = [];

    int daysInMonth = DateTime(year, month + 1, 0).day;

    for (int i = 1; i <= daysInMonth; i++) {
      DateTime date = DateTime(year, month, i);
      int weekday = date.weekday % 7;
      days.add(Day(date: i, weekday: weekday, month: month, year: year));
    }

    return days;
  }

  String _getMonthName(int month) {
    switch (month) {
      case 1:
        return 'Jan';
      case 2:
        return 'Feb';
      case 3:
        return 'Mar';
      case 4:
        return 'Apr';
      case 5:
        return 'May';
      case 6:
        return 'Jun';
      case 7:
        return 'Jul';
      case 8:
        return 'Aug';
      case 9:
        return 'Sep';
      case 10:
        return 'Oct';
      case 11:
        return 'Nov';
      case 12:
        return 'Dec';
      default:
        return '';
    }
  }
}


