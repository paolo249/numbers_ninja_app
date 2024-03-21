import 'package:flutter/material.dart';
import 'package:numbers_ninja_app/widgets/quizscreen.dart';

class Menu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // debugPrint(num1.toString());

    return Scaffold(
      backgroundColor: Color.fromRGBO(116, 105, 243, 1),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Title
          Text(
            'Number Ninja',
            style:
                TextStyle(fontSize: 34, color: Color.fromARGB(255, 15, 15, 15)),
          ),
          // Gap between Title and button
          Container(height: 200),
          // Button

          ElevatedButton(
            onPressed: () {},
            child: GestureDetector(
              onTap: () {
                Navigator.pushNamed(
                  context,
                  "/quiz",
                );
              },
              child: Container(
                child: Text(
                  'Start Game',
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ...
