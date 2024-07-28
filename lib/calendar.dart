import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:theproject1/auth_service.dart';
import 'package:theproject1/datedetailspage.dart';
import 'package:theproject1/day.dart';
import 'package:theproject1/loginpagewithemail.dart';

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
    final _auth = AuthService();

    List<Day> daysInMonth = _generateDaysInMonth(year, month);
    List<String> dayNames = ['MON', 'TUE', 'WED', 'THU', 'FRI', 'SAT', 'SUN'];

    final firstDay = DateTime(year, month, 1);
    final weekdayOffset = (firstDay.weekday - DateTime.monday) % 7;

    return Scaffold(
      body: Center(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 32.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildLogoutButton(_auth, context),
                  _buildMonthNavigation(),
                  _buildDayNames(dayNames),
                  _buildDaysGrid(daysInMonth, weekdayOffset),
                ],
              ),
            ),
            _buildFooter(),
          ],
        ),
      ),
    );
  }

  Widget _buildLogoutButton(AuthService auth, BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        IconButton(
          onPressed: () async {
            await auth.signout();
            goToLogin(context);
          },
          icon: const Icon(Icons.logout_rounded, size: 25, color: Color(0xFF482BAD)),
        ),
      ],
    );
  }

  Widget _buildMonthNavigation() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15.0),
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
              size: 35.0,
            ),
          ),
          Text(
            '${_getMonthName(month)} $year',
            style: GoogleFonts.rubik(
              color: const Color(0xFF482BAD),
              fontWeight: FontWeight.w800,
              fontSize: 30,
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
              size: 35.0,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDayNames(List<String> dayNames) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: dayNames.map((name) {
        return Text(
          name,
          style: GoogleFonts.rubik(
            fontWeight: FontWeight.w500,
            fontSize: 20,
            color: const Color(0xFF110340),
          ),
        );
      }).toList(),
    );
  }

  Widget _buildDaysGrid(List<Day> daysInMonth, int weekdayOffset) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 7,
          ),
          itemCount: daysInMonth.length + weekdayOffset,
          itemBuilder: (BuildContext context, int index) {
            if (index < weekdayOffset) {
              return const SizedBox.shrink();
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
                child: Text(
                  '${day.date}',
                  style: GoogleFonts.rubik(
                    color: const Color(0xFF110340),
                    fontWeight: FontWeight.w400,
                    fontSize: 20,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildFooter() {
    return Positioned(
      top: MediaQuery.of(context).size.height * 0.6,
      left: 0,
      right: 0,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildColorBox(Colors.red),
              _buildColorBox(Colors.green),
              _buildColorBox(Colors.blue),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildColorBox(Color color) {
    return Container(
      color: color,
      width: 100.0,
      height: 100.0,
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

  void goToLogin(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const LoginPageWithEmail()),
    );
  }
}
