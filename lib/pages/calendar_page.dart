import 'package:flutter/material.dart';
import '../component/panel_generator.dart';
import '../models/colors.dart';
import '../models/date.dart';

class CalendarPage extends StatefulWidget {
  const CalendarPage({super.key});

  @override
  State<CalendarPage> createState() => _CalendarPage();
}

class _CalendarPage extends State<CalendarPage> {
  ColorPallete color = ColorPallete();
  MySchedule mySched = MySchedule();
  List<Map<String, dynamic>> dataSched = [];
  String day = "";

  void setDate() {
    DateTime now = DateTime.now();
    int currentDayOfWeek = now.weekday;

    if (currentDayOfWeek == 1) {
      dataSched = mySched.monday;
      day = "Monday";
    } else if (currentDayOfWeek == 2) {
      dataSched = mySched.tuesday;
      day = "Tuesday";
    } else if (currentDayOfWeek == 3) {
      dataSched = mySched.wednesday;
      day = "Wednesday";
    } else if (currentDayOfWeek == 4) {
      dataSched = mySched.thursday;
      day = "Thursday";
    } else if (currentDayOfWeek == 5) {
      dataSched = mySched.friday;
      day = "Friday";
    } else if (currentDayOfWeek == 6) {
      dataSched = mySched.saturday;
      day = "Saturday";
    } else if (currentDayOfWeek == 7) {
      dataSched = mySched.sunday;
      day = "Sunday";
    }
    // dataSched = mySched.wednesday;
    // day = "Wednesday";
  }

  @override
  void initState() {
    super.initState();
    setDate();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color.white,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title
            Text(
              'Today Class: $day',
              style: TextStyle(
                color: color.stiColor,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            // Divier
            Container(
              padding: const EdgeInsets.only(left: 1, right: 1, bottom: 10),
              child: Divider(
                color: Colors.grey[700],
              ),
            ),

            // Content
            PanelGen(dataSched: dataSched),
          ],
        ),
      ),
    );
  }
}
