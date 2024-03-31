import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:numbers_ninja_app/logics/UserScoreCounter.dart';
import 'package:numbers_ninja_app/widgets/quizscreen.dart';


class QuizScreenStateless extends StatelessWidget {
  const QuizScreenStateless({super.key});

  @override
  Widget build(BuildContext context) {

    return Column( 
           children: [
            // Container(height: 10),
            Text('Quiz Screens', style: TextStyle(fontSize: 34, color: Color.fromARGB(255, 10, 1, 1))),
            SizedBox(
              // padding: EdgeInsets.all(2.0),
              // UserScore
              // Math Operation Equation
              // Operational Buttons
              height: 400, 
              width: 270,
              child: UserScoreCounter(),
              )
           
              
            ],
            
            
          
          );
  
    
   
  
  }
}

