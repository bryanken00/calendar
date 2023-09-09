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
    // dataSched = mySched.sunday;

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
  }

  void updateDay(String selectedDay) {
    setState(() {
      day = selectedDay;
      if (selectedDay == 'All') {
        dataSched = mySched.getAllSchedules();
      } else if (selectedDay == 'Monday') {
        dataSched = mySched.monday;
      } else if (selectedDay == 'Tuesday') {
        dataSched = mySched.tuesday;
      } else if (selectedDay == 'Wednesday') {
        dataSched = mySched.wednesday;
      } else if (selectedDay == 'Thursday') {
        dataSched = mySched.thursday;
      } else if (selectedDay == 'Friday') {
        dataSched = mySched.friday;
      } else if (selectedDay == 'Saturday') {
        dataSched = mySched.saturday;
      } else if (selectedDay == 'Sunday') {
        dataSched = mySched.sunday;
      }
    });
  }

  @override
  void initState() {
    super.initState();
    setDate();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //Title
              Text(
                'Today Class: $day',
                style: TextStyle(
                  color: color.stiColor,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),

              //Divider
              Container(
                padding: const EdgeInsets.only(left: 1, right: 1, bottom: 10),
                child: Divider(
                  color: Colors.grey[700],
                ),
              ),

              SizedBox(
                height: 60,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    for (String days in [
                      'All',
                      'Monday',
                      'Tuesday',
                      'Wednesday',
                      'Thursday',
                      'Friday',
                      'Saturday',
                      'Sunday',
                    ])
                      GestureDetector(
                        onTap: () {
                          updateDay(days);
                          print('Tapped on $day');
                        },
                        child: Container(
                          margin: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(30), // Rounded edges
                            color: Colors
                                .blue, // Replace with your desired button color
                          ),
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                days,
                                style: const TextStyle(
                                  color: Colors
                                      .white, // Replace with your desired text color
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ),

              // Content
              PanelGen(dataSched: dataSched),
            ],
          ),
        ),
      ),
    );
  }
}
