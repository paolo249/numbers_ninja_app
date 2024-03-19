
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
   '*'

  ];


 Map<int,String> numToMathOp = {
    1: '+',
    2: '-',
    3: '/',
    4: '*'
 };

 

 // answer
  String answer = '';

// user tapped button
void buttonTapped(String button){
  setState((){
    // max of 1 math operation
    if(answer.isEmpty){
    answer = button;
    counter++;
    }
  }
  
  );
  // resetState();
}
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
  //  num3Answer(num1, num2, numToChar, valueForKey);

   String checkAnswer(int index){
     String name = '';
    if(valueForKey == mathOperations[index]){
      name = 'Correct';
      
   }
   return name;
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
            const Text('Quiz Screen', style: TextStyle(fontSize: 34, color: Colors.black)),
            
            Text("ValueForKey Test: " + valueForKey, style: TextStyle(fontSize: 20, color: Colors.black)),
            // Math Equation - Question
            Expanded(
              child: Center(
                
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  
                  // child: Container(
                  children: [
                    // Question
                    
                    Text(
                       num1.toString(),
                       style: normalTextStyle,
                    ),

                    // User Input for Math Operation
                    SizedBox(width: 7),
                    Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        color: Colors.grey[500],
                        borderRadius: BorderRadius.circular(4), 
                      ),
                      child: Center(child: Text(answer, style: normalTextStyle)),
                    ),
                    SizedBox(width: 7),
                    Text(
                        num2.toString() + " = " + num3.toString(),
                         style: normalTextStyle,
                    ),
                    // SizedBox(width: 7),
                    // Text(
                    //     '=',
                    //      style: normalTextStyle,
                    // ),
                    // SizedBox(width: 7),                                           
                    // Text(
                    //     num3.toString(),
                    //      style: normalTextStyle,
                    // ),

                    // Answer
                   
                  ],
                // ),
                )
              ), 
              ),
            // Operation Button
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: GridView.builder(
                  itemCount: mathOperations.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                ),
                itemBuilder: (context, index) {
                  return MyButton(
                    child: mathOperations[index],
                    onTap: () {
                      buttonTapped(mathOperations[index]);
                      Navigator.pushReplacement(context, 
                      MaterialPageRoute(builder: (_) => QuizScreen()),
                      );
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



