import 'package:calendar/models/colors.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
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
  Widget build(BuildContext context) {
    return Center(
      child: Scaffold(
        appBar: AppBar(
          leading: Builder(
            builder: (context) => IconButton(
              icon: const Padding(
                padding: EdgeInsets.only(left: 12.0),
                child: Icon(
                  Icons.menu,
                  color: Colors.black,
                ),
              ),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            ),
          ),
        ),

        // Drawer
        drawer: SafeArea(
          child: Drawer(
            // backgroundColor: color.drawerBackgroundColor,
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                      Text(
                        '$userName',
                        style: TextStyle(
                          color: color.fontHeader,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Sans',
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        '$userID',
                        style: TextStyle(
                          color: color.fontHeader,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Sans',
                        ),
                      ),
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
        ),
      ),
    );
  }
}
