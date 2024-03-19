
// import 'package:english_words/english_words.dart';

import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:numbers_ninja_app/const.dart';
import 'package:numbers_ninja_app/util/user_button.dart';
import 'package:provider/provider.dart';
import 'dart:math';

void main() {
  FlutterError.onError = (details) {
    FlutterError.presentError(details);
    if (kReleaseMode) exit(1);
  };
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyAppState(),
      child: MaterialApp(
        routes:{

        },
        title: 'Number Ninja App',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 133, 34, 255)),
        ),
        home: Menu(),
      ),
    );
  }
}

class MyAppState extends ChangeNotifier {
  // var current = WordPair.random();
  late Random random;

  void getNext(){
    // current = WordPair.random();
    notifyListeners();
  }

  MyAppState(){
    random = Random();
  }

  int generateRandomNumber1(){
    return random.nextInt(10);
  }

  int generateRandomNumber2(){
    return random.nextInt(4) + 1;
  }




}

// ...


class Menu extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    var appState = context.watch<MyAppState>();
   


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
            style: TextStyle(fontSize: 34, color: Color.fromARGB(255, 15, 15, 15)),
            ),
            // Gap between Title and button
            Container(height: 200),
            // Button
            
            ElevatedButton(
              onPressed: () {
                appState.getNext();
              },
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => QuizScreen()),
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


class UserCreateScreen extends StatelessWidget {
 const UserCreateScreen({
    super.key,

  });

  // final WordPair pair;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

    );
  }
}

// ...


class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
  
}

class _QuizScreenState extends State<QuizScreen> {
  // List of Math Operations
  int counter = 0;

  List<String> mathOperations = [
   '+',
   '-',
   '/',
   '*',
   'Confirm'

  ];


 Map<int,String> numToMathOp = {
    1: '+',
    2: '-',
    3: '/',
    4: '*',
    5: 'Confirm'
 };

 

 // answer
  String answer = '';

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

// user tapped button
// void buttonTapped(String button){
    
//   setState((){
//     // max of 1 math operation
 
//     if(answer.isEmpty){
//     answer = button;
//     counter++;
//     }
//   }
  
//   );
//   // resetState();
// }
void resetState(){
  setState((){
    answer = '';
    counter = 0;
  });

}

// Check user if Correct or Incorrect
// void checkAnswer(num3Answer(num1, num2, numToChar, valueForKey)){
//    if(valueForKey == '+'){
//    }
//    }

  @override
  Widget build(BuildContext context) {
   var appState = context.watch<MyAppState>();
   int num1 = appState.generateRandomNumber1();  
   int num2 = appState.generateRandomNumber1();
   int num3 = 0;
   int numToChar = appState.generateRandomNumber2();
   // Randomizes the MathOperation based on Key-value pair (+,-,/,*)
   String valueForKey = numToMathOp[numToChar]!;
   
   int num3Answer(num1, num2, numToChar, valueForKey){
      try{

      if(valueForKey == '+'){
        num3 = num1 + num2;
        
      }
      else if(valueForKey == '-'){
        num3 = num1 - num2;
      }
      else if(valueForKey == '/'){
        num3 = num1 / num2;
    
      }
      else if(valueForKey == '*'){
        num3 = num1 * num2;
      }
     }
      catch(e){
         print('An exception occurred: $e');
      }
  
      // resetState();
      num3 = num3.toInt();
      return num3;
   }
   num3Answer(num1, num2, numToChar, valueForKey);

   void checkAnswer(String button){
    
      if(valueForKey == button){
      
      showDialog(
        context: context, 
        builder: (context) {
          return AlertDialog(
            content: Container(
              height: 200,
              color: Colors.deepPurple,
              child: Column(
                children: [
                  Text('Correct!',
                  style: normalTextStyle),
                  Container(
                  decoration: BoxDecoration(color: Colors.deepPurple[300]),
                  child: Center(
                    child: Icon(
                      Icons.arrow_forward,
                      color: Colors.white,
                    ),
                    ),
                  ),
                ],
             
                
                ),
              ),
          );
      });
   
    
    }
  //   if(valueForKey == mathOperations[index]){
      
  //     showDialog(
  //       context: context, 
  //       builder: (context) {
  //         return AlertDialog(
  //           content: Container(
  //             height: 200,
  //             color: Colors.deepPurple,
  //             child: Column(
  //               children: [
  //                 Text('Correct!',
  //                 style: normalTextStyle),
  //                 Container(
  //                 decoration: BoxDecoration(color: Colors.deepPurple[300]),
  //                 child: Center(
  //                   child: Icon(
  //                     Icons.arrow_forward,
  //                     color: Colors.white,
  //                   ),
  //                   ),
  //                 ),
  //               ],
             
                
  //               ),
  //             ),
  //         );
  //     });
  //  }

   }

  void buttonTapped(String button){
  // int valueResult = getKeyFromValue(numToMathOp, button);
  setState((){
    // max of 1 math operation
    if(button == "Confirm"){
      checkAnswer(button);
    }
    else if(answer.isNotEmpty){
    answer = answer.substring(0, answer.length - 1);
    }
    else if(answer.length < 1){
    answer += button;
    counter++;
    }
  }
  
  );
  // resetState();
}



    return MaterialApp(
     
      title: 'Number Ninja: Quiz', 
      home: Scaffold(
        
        backgroundColor: Color.fromRGBO(242, 229, 196, 1),
        body: Column(
          children: [ 
            // Title
            Container(
            height: 80),
            Text('Quiz Screen', style: TextStyle(fontSize: 34, color: Colors.black)),
            
            Text("ValueForKey Test: " + valueForKey, style: TextStyle(fontSize: 20, color: Colors.black)),
            // Math Equation - Question
            MathEquation(num1: num1, answer: answer, num2: num2, num3: num3),
            // Operation Button
            Expanded(
              flex: 2,
              child: Container(
                padding: const EdgeInsets.all(4.0),
                
         
                child: GridView.builder(
                  itemCount: mathOperations.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    
                ),
                itemBuilder: (context, index) {
                  return MyButton(
                    child: mathOperations[index],
                    onTap: () {
                      buttonTapped(mathOperations[index]);
                      // checkAnswer(index);
                      // Navigator.pushReplacement(context, 
                      // PageRouteBuilder(pageBuilder: (_, __, ___) => QuizScreen(),
                      // transitionDuration: Duration(milliseconds: 800),
                      // transitionsBuilder: (_, animation, __, child){
                      //   return FadeTransition(
                      //     opacity: animation,
                      //     child: child,
                      //   );
                      // },
                      // ),
                      // ); // Navigator
                    },
                    
                    );
                }),
              ),
              ), 
            ],
            )

      )


    );
    
    
  
  }
}

class MathEquation extends StatelessWidget {
  const MathEquation({
    super.key,
    required this.num1,
    required this.answer,
    required this.num2,
    required this.num3,
  });

  final int num1;
  final String answer;
  final int num2;
  final int num3;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // First element of Math Operation
            Text(
               num1.toString(),
               style: normalTextStyle,
            ),
  
            SizedBox(width: 7),

            // User Input for Math Operation (Grey Box)
            Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                color: Colors.grey[500],
                borderRadius: BorderRadius.circular(4), 
              ),
              child: Center(
                child: Text(answer, style: normalTextStyle)),

            ),
            SizedBox(width: 7),

            // Concatenate last three elements of Math Operation
            Text(
                num2.toString() + " = " + num3.toString(),
                 style: normalTextStyle,
            ),
           
          ],
        )
      ), 
      );
  }
}


class GameOverScreen extends StatelessWidget{
   const GameOverScreen({
    super.key,
  });
 @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final style = theme.textTheme.bodyLarge!.copyWith(
      color: theme.colorScheme.onPrimary,
    );
    return Card(
      color: theme.colorScheme.primary,
      child: Padding(
        padding: const EdgeInsets.all(20),
      ),
    );
  }
}



