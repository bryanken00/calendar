import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/colors.dart';

class MyDrawer extends StatefulWidget {
  MyDrawer({super.key});

  @override
  State<MyDrawer> createState() => _MyDrawer();
}

class _MyDrawer extends State<MyDrawer> {
  String? userName;
  String? userID;

  ColorPallete color = ColorPallete();

  @override
  void initState() {
    super.initState();
    getUserName();
  }

  Future<void> getUserName() async {
    final prefs = await SharedPreferences.getInstance();
    setState(
      () {
        userName = prefs.getString('userName');
        userID = prefs.getString('userID');
      },
    );
  }

  Future<void> removeInput() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('userName');
    await prefs.remove('userID');
  }

  @override
  Widget build(Object context) {
    return SafeArea(
      child: Drawer(
        child: Column(
          children: [
            Container(
              color: color.stiBackground,
              child: Column(
                children: [
                  // Logo
                  Image.asset(
                    'lib/images/STI.png',
                    height: 100,
                  ),

                  const SizedBox(height: 20),

                  //Username
                  Text('$userName',
                      style: GoogleFonts.lato(
                        textStyle: TextStyle(
                          color: color.fontHeader,
                          fontSize: 24,
                        ),
                      )),

                  const SizedBox(height: 5),
                  Text('$userID',
                      style: GoogleFonts.lato(
                        textStyle: TextStyle(
                          color: color.fontHeader,
                          fontSize: 24,
                        ),
                      )),

                  const SizedBox(height: 10),

                  // divider
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25.0),
                    child: Divider(
                      color: Colors.transparent,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                color: color.stiColor,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Column(
                      children: [
                        // Home
                        Padding(
                          padding: EdgeInsets.only(left: 25),
                          child: ListTile(
                            leading: Icon(Icons.home, color: Colors.white),
                            title: Text(
                              'Home',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),

                        // About
                        Padding(
                          padding: EdgeInsets.only(left: 25),
                          child: ListTile(
                            leading: Icon(Icons.info, color: Colors.white),
                            title: Text(
                              'About',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                    GestureDetector(
                      onTap: removeInput,
                      child: const Padding(
                        padding: EdgeInsets.only(left: 25, bottom: 25),
                        child: ListTile(
                          leading: Icon(Icons.logout, color: Colors.white),
                          title: Text(
                            'Logout',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
