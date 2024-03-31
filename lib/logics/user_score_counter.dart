import 'dart:math';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:numbers_ninja_app/logics/math_equation.dart';
import 'package:numbers_ninja_app/util/user_button.dart';
// import 'package:flutter/foundation.dart';

class user_score_counter extends StatefulWidget {
  const user_score_counter({super.key});


  @override
  State<user_score_counter> createState() => _UserScoreCounter();
}

class _UserScoreCounter extends State<user_score_counter> {
  int _userScore = 0;
  int counter = 0;
  int numToChar = 0;
  
 int generateRandomNumber1(){
    return Random().nextInt(10);
  }

 int generateRandomNumber2(){
    return Random().nextInt(4) + 1;
  }

  int num1 = 0; 
  int num2 = 0;
  int num3 = 0;
  String valueForKey = '';
    // User answer from Math Operation buttons
  String greyBoxInput = ' ';


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
 
  void _incrementedCounter(){
    setState(() {
      _userScore++;
    });
  }

  void buttonTapped(String button){
    setState((){
    // max of 1 math operation
      if(greyBoxInput == ' '){
        greyBoxInput = greyBoxInput + button;
      }
    }
  
  );

  // resetState();
}
  
  int num3Answer(num1, num2, num3, numToChar, valueForKey) {
    // Randomizes the MathOperation based on Key-value pair (+,-,/,*)
    num3 = -1;
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
      else {num3Answer(num1, num2, num3, numToChar, valueForKey);}
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
    num3 = num3.toInt();
    return num3;  
   }




  @override
  void initState(){
    super.initState();
    num1 = generateRandomNumber1();  
    num2 = generateRandomNumber1();
    numToChar = generateRandomNumber2();
    greyBoxInput = ' ';
    valueForKey = numToMathOp[numToChar]!;
    num3 = num3Answer(num1, num2, num3, numToChar, valueForKey);
  }


  @override
  Widget build(BuildContext context) {  
    bool checkAnswer(String button){
      if(valueForKey == button){
        showDialog(
          context: context, 
          builder: (context){
            return AlertDialog(
              content: Container(
              height: 200,
              color: const Color.fromARGB(255, 58, 183, 85),
              child: const Column(children: [Text('Correct!')]))
            );
          });
        return true;
      }
      else{return false;}
    }
    
   
    return Column(
      children: [
        Expanded(
          child: Text('Score: $_userScore', style: const TextStyle(fontSize: 20, color: Colors.black))
                ),
        MathEquation(num1: num1, greyBoxInput: greyBoxInput, num2: num2, num3: num3),
        Expanded(
          flex:2,
          child: GridView.builder(
          itemCount: mathOperations.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
          itemBuilder: (context, index) {
          return MyButton(
            // create new variable holding it
            child: mathOperations[index], 
            onTap: () async {
              buttonTapped(mathOperations[index]); 
              bool flag = checkAnswer(mathOperations[index]);
              if(flag == true){ 
                _incrementedCounter(); 
              }
              await Future.delayed(const Duration(milliseconds: 550));
              num1 = generateRandomNumber1();  
              num2 = generateRandomNumber1();
              numToChar = generateRandomNumber2();
              valueForKey = numToMathOp[numToChar]!;
              num3 = num3Answer(num1, num2, num3, numToChar, valueForKey);
              greyBoxInputMethod();
              },
                        
          );
          }
          ),
        )
      ],
    );
  }

  void greyBoxInputMethod() => setState(() {
    greyBoxInput = ' ';
  });
}