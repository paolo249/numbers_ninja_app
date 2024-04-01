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
  int index = 0;
  int num1 = 0; 
  int num2 = 0;
  int num3 = 0;
  String valueForKey = '';
  String greyBoxInput = ' ';  // User answer from Math Operation buttons
  
  List<String> mathOperations = [
   '+',
   '-',
   '/',
   '*',
  ];
  Map<int,String> numToMathOp = {
    1: '+',
    2: '-',
    3: '/',
    4: '*',
  };
 




  
  int generateRandomNumber1(){
    return Random().nextInt(10);
  }
  int generateRandomNumber2(){
    return Random().nextInt(4) + 1;
  }



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

}
  
  List <int> num3Answer(num1, num2, num3, numToChar, valueForKey, index, mathOperations) {
    // Randomizes the MathOperation based on Key-value pair (+,-,/,*)
  
    List<int> factors = [];
    num3 = -1;
    
    try{
      if(valueForKey == '+'){
        if(num1 < num2){
          num3 = num1 + num2; 
            print("num1: " +  "$num1");
            print("num2: " +  "$num2");
            print("num3: " +  "$num3"); 
          print("$num1 + $num2 = $num3");
          return [num2, num3, num1];
        }

        else if(num1 > num2) {
          num3 = num1 + num2;
            print("num1: " +  "$num1");
            print("num2: " +  "$num2");
            print("num3: " +  "$num3");
            print("$num1 + $num2 = $num3");
         return [num2, num3, num1];
        }
          
      }
      else if(valueForKey == '-'){
             num3 = num1 - num2;
            print("$num1 - $num2 = $num3");
        return [num2, num3, num1];
      }

      else if(valueForKey == '/'){
        if(num1 == 1 && num2 == 1){
          num3 = 1;
          return [num2, num3, num1];
        }
        else{
        for (int i = 1; i <= num1; i++) {
          if (num1 % i == 0) {
            factors.add(i);
            print(factors); // i is a factor of n
          }
        }
        int randFactoridx = Random().nextInt(factors.length); 
        num2 = factors[randFactoridx];
        num3 = num1 / num2;
        
        print("$num1 / $num2 = $num3");
        return [num2, num3, num1];
        }
      }

      else if(valueForKey == '*'){
        num3 = num1 * num2;
        print("$num1 * $num2 = $num3");
        return [num2, num3, num1];
      }
     }
    catch(e){
      if (kDebugMode) {
        print('An exception occurred: $e');
      }
    } 
    // num3 = num3.toInt();
    return [num2, num3, num1];
   }

  @override
  void initState(){
    super.initState();
    num1 = generateRandomNumber1();  
    num2 = generateRandomNumber1();
    numToChar = generateRandomNumber2();
    greyBoxInput = ' ';
    valueForKey = numToMathOp[numToChar]!;  // maps a random key (1-4) to value('+','-','/','*')
    List<int> math_var = num3Answer(num1, num2, num3, numToChar, valueForKey, index, mathOperations); 
    num2 = math_var[0]; 
    num3 = math_var[1]; 
  }

  @override
  Widget build(BuildContext context) {  
    bool checkAnswer(String button){
      List<int> math_var = num3Answer(num1, num2, num3, numToChar, valueForKey, index, mathOperations); 
      num2 = math_var[0];
      num3 = math_var[1];
      num1 = math_var[2];
      // if(num2 == 1 && num1 == num3){
      //   if(valueForKey == '/' || valueForKey == '*'){
      //     if(mathOperations[index] == '/' || mathOperations[index] == '*'){
      //     showDialog(
      //       context: context, 
      //       builder: (context){
      //       return AlertDialog(
      //         content: Container(
      //         height: 200,
      //         color: const Color.fromARGB(255, 58, 183, 85),
      //         child: const Column(children: [Text('Correct!')]))
      //       );
      //     });
          
      //     }
      //   // else{return false;}
      //   }
      //   return true;
      // }
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
          var mathOperation = mathOperations[index];
          return MyButton(
            // create new variable holding it
            child: mathOperation, 
            onTap: () async {
              buttonTapped(mathOperation); 
              bool flag = checkAnswer(mathOperation);
              if(flag == true){ 
                _incrementedCounter(); 
              }
              await Future.delayed(const Duration(milliseconds: 550));
              num1 = generateRandomNumber1();  
              numToChar = generateRandomNumber2();
              valueForKey = numToMathOp[numToChar]!;
              List<int> math_var = num3Answer(num1, num2, num3, numToChar, valueForKey, index, mathOperations);
              num2 = math_var[0];
              num3 = math_var[1];
              print("num2: " + "$num2");
              print("num3: " + "$num3");
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