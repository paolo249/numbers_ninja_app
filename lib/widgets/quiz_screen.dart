import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:numbers_ninja_app/logics/user_score_counter.dart';



class quiz_screen extends StatelessWidget {
  const quiz_screen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column( 
           children: [
            Text('Quiz Screen', style: TextStyle(fontSize: 34, color: Color.fromARGB(255, 10, 1, 1))),
            SizedBox(
              // UserScore
              // Math Operation Equation
              // Operational Buttons
              height: 400, 
              width: 270,
              child: user_score_counter(),
              ) 
          ],
        );
  }
}

