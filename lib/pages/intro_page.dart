import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../component/my_textField.dart';
import '../models/colors.dart';

class MyIntroPage extends StatefulWidget {
  MyIntroPage({super.key});

  @override
  State<StatefulWidget> createState() => _MyIntroPage();
}

class _MyIntroPage extends State<MyIntroPage> {
  // Controller
  final userNameController = TextEditingController();
  final userIDController = TextEditingController();

  final ColorPallete _color = ColorPallete();

  Future<void> saveInput() async {
    String userInput = userNameController.text;
    String userID = userIDController.text;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('userName', userInput);
    await prefs.setString('userID', userID);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _color.white,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'lib/images/STI.png',
              height: 100,
            ),
            Text(
              'Fill up the bank below',
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: _color.stiColor),
            ),

            const SizedBox(height: 40),

            // TextField
            MyTextField(
              controller: userNameController,
              hintText: 'Username',
              obscureText: false,
            ),

            const SizedBox(height: 10),
            MyTextField(
              controller: userIDController,
              hintText: 'Student ID',
              obscureText: false,
            ),

            const SizedBox(height: 10),

            // Butto
            GestureDetector(
              onTap: saveInput,
              child: Container(
                padding: const EdgeInsets.all(25),
                margin: const EdgeInsets.symmetric(horizontal: 25),
                decoration: BoxDecoration(
                  color: _color.stiColor,
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Center(
                    child: Text(
                  'Register',
                  style: TextStyle(
                    color: _color.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
