import 'dart:async';
import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:numbers_ninja_app/const.dart';
import 'package:numbers_ninja_app/util/user_button.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});
  
  @override
  State<QuizScreen> createState() => _QuizScreenState();

}
  


class _QuizScreenState extends State<QuizScreen> {
  int counter = 0;
  late Timer _timer;
   // User answer from Math Operation buttons
  String answer = '';


  // List of Math Operations
  List<String> mathOperations = [
   '+',
   '-',
   '/',
   '*',
  //  'Confirm'

  ];
  Map<int,String> numToMathOp = {
    1: '+',
    2: '-',
    3: '/',
    4: '*',
    // 5: 'Confirm'
 };
 
 // Game Logic
 
  void updateUserScore(){
    setState((){
      // userScore++;
    });
  }
  // Get key from value using numToMathOp map
  int getKeyFromValue(Map<int, String> numToMathOp, String value) {
    
  for (var entry in numToMathOp.entries) {
    if (entry.value == value) {
      return entry.key;
    }
  }
  return 0;
  
   // If the value is not found in the map
}
// User taps Math Operation button
  void buttonTapped(String button){
    setState((){
    // max of 1 math operation
    if(answer.isEmpty){
    answer = answer + button;
    counter++;
    }
    
  }
  
  );

  // resetState();
}
// Reset State
  void resetState(){
    setState((){
      answer = '';
      counter = 0;
    });
  }
 

 
 
// Timer Logic
  // void _startTimer(){
  //     const speed = Duration(seconds: 1);
  //     _timer = Timer.periodic(speed, (timer){
  //       if (_value > 0){
  //         setState((){_value -= 0.1;});
          
  //       }
  //       else {
  //         setState((){ _timer.cancel();});
         
  //        }
  //     });
  //   }

   @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // _startTimer();  // only run when it starts; problem is still going to rebuild it
    randomFunction();
  }


  

   int generateRandomNumber1(){
    return Random().nextInt(10);
  }

  int generateRandomNumber2(){
    return Random().nextInt(4) + 1;
  }

 int? num1;
 int? num2; 
 int? numToChar;


 void randomFunction() {
  num1 = generateRandomNumber1();  
  num2 = generateRandomNumber1();
  numToChar = generateRandomNumber2();
  }
   
  
  @override
  Widget build(BuildContext context) {

  // if statement
  // when they answer 
  // don't run build in start timer
  // only run once when it starts
  // Read more on widget lifescyle (init state)
  //
  
  //  int num1 = appState.generateRandomNumber1();  
  //  int num2 = appState.generateRandomNumber1();
   int num3 = 0;
  //  int numToChar = appState.generateRandomNumber2();
   // Randomizes the MathOperation based on Key-value pair (+,-,/,*)
   String valueForKey = numToMathOp[numToChar]!;
   
 
   // Displays the answer for the math equation on Quiz Screen
   int num3Answer(num1, num2, numToChar, valueForKey) {
      try{

      if(valueForKey == '+'){
        num3 = num1 + num2;
        
      }
      else if(valueForKey == '-'){
        num3 = num1 - num2;
      }
      else if(valueForKey == '/'){
        // Checks to see if denominator is greater than 0, so that quotient does not result in infinity (causing error)
        if(num2 > 0){
        num3 = num1 / num2;
        }
        // If num2 <= 0 recall the function
        else {num3Answer(num1, num2, numToChar, valueForKey);}
      }
      else if(valueForKey == '*'){
        num3 = num1 * num2;
      }
     }
      catch(e){
         if (kDebugMode) {
           print('An exception occurred: $e');
         }
      }
  
      // resetState();
      num3 = num3.toInt();
      return num3;
   }
   num3Answer(num1, num2, numToChar, valueForKey);

   bool checkAnswer(String button){
    // widget.updateUserScore(userScore);
    buttonTapped(button);
      if(valueForKey == button){
        // userScore++;
        showDialog(
          context: context, 
          builder: (context) {
            return AlertDialog(
              content: Container(
                height: 200,
                color: const Color.fromARGB(255, 58, 183, 85),
                child: Column(
                  children: [
                    Text('Correct!',
                    style: normalTextStyle),
                  ],
                ),
              ),
          );
      });
      // resetState();
      return true;
    }else{
      return false;
    }
   }

    return Scaffold(
        backgroundColor: const Color.fromRGBO(242, 229, 196, 1),
        
        // body:
        // createGame(num1, num2, num3, checkAnswer),
        
        
      );
    
  }
 
  Column createGame(int num1, int num2, int num3, bool Function(String button) checkAnswer) {
    int num1 = generateRandomNumber1();  
    return Column(
        children: [ 
          // Title
          Container(height: 80),
          // Text('Quiz Screen', style: TextStyle(fontSize: 34, color: Colors.black)),
          // Uncomment the code line below to display answer on Quiz Scren
          // Text("ValueForKey Test: " + valueForKey, style: TextStyle(fontSize: 20, color: Colors.black)),

          // Timer
          // Text('${(_value*10).toInt()}',
          // style: TextStyle(fontSize: 30),
          // ),
          // Score Count
          // Text('Score: $userScore', style: const TextStyle(fontSize: 34, color: Colors.black)),
          // Math Equation - Question
          // MathEquation(num1: num1, answer: answer, num2: num2, num3: num3),

          // Operation Button
          Expanded(
            flex: 2,
            child: Container(
              padding: const EdgeInsets.all(4.0),
              child: GridView.builder(
                itemCount: mathOperations.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                ),
                itemBuilder: (context, index) {
                  return MyButton(
                    child: mathOperations[index], // create new variable holding it
                    // child: num1.toString(),
                    onTap: () {
                      buttonTapped(mathOperations[index]); 
                      bool flag = checkAnswer(mathOperations[index]);
                      if(flag == true){updateUserScore();}
                    // Builds new widget QuizScreen
                    Navigator.pushReplacement(context, 
                    PageRouteBuilder(pageBuilder: (_, __, ___) => const QuizScreen(),
                    transitionDuration: const Duration(milliseconds: 800),
                    transitionsBuilder: (_, animation, __, child){
                      return FadeTransition(
                        opacity: animation,
                        child: child,
                      );
                    },
                    ),
                    ); // Navigator
                    },
                  );
                 }),
            ),
          ), 
        ],
      );
  }
}

