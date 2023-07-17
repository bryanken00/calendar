import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'intro_page.dart';
import 'home_page.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  String? userName;
  String? userID;

  @override
  void initState() {
    super.initState();
    checkUserInput();
  }

  Future<void> checkUserInput() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      userName = prefs.getString('userName');
      userID = prefs.getString('userID');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<void>(
        future: checkUserInput(),
        builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
          if (userName != null &&
              userName!.isNotEmpty &&
              userID != null &&
              userID!.isNotEmpty) {
            return HomePage();
          } else {
            return MyIntroPage();
          }
        },
      ),
    );
  }
}
