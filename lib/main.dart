
// import 'package:english_words/english_words.dart';


import 'package:flutter/material.dart';
import 'package:numbers_ninja_app/const.dart';
import 'package:numbers_ninja_app/util/user_button.dart';
import 'package:provider/provider.dart';
import 'dart:math';

void main() {
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

  // int generateRandomNumber2(){
  //   return random.nextInt(10);
  // }

  // var favorites = <WordPair>[];


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
  List<String> mathOperations = [
   '+',
   '-',
   '/',
   '*'

  ];
 // answer
  String answer = '';
// user tapped button
void buttonTapped(String button){
  setState((){
    // max of 1 math operation
    if(answer.length < 1){
    answer += button;
    }
  });
}

  @override
  Widget build(BuildContext context) {
   var appState = context.watch<MyAppState>();
   int num1 = appState.generateRandomNumber1();  
    return MaterialApp(
     
      title: 'Number Ninja: Quiz', 
      home: Scaffold(
        backgroundColor: Color.fromRGBO(242, 229, 196, 1),
        body: Column(
          children: [ 
            // Title
            Container(
            height: 80),
            const Text('Quiz Screen UIT', style: TextStyle(fontSize: 34, color: Colors.black)),
            
            // Math Equation - Question
            Expanded(
              child: Center(
                
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  
                  // child: Container(
                  children: [
                    // Question
                    
                    Text(
                       '5',
                        style: normalTextStyle,
                        
                    ),
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
                        '5',
                         style: normalTextStyle,
                    ),
                    SizedBox(width: 7),
                    Text(
                        '=',
                         style: normalTextStyle,
                    ),
                    SizedBox(width: 7),
                    Text(
                        '10',
                         style: normalTextStyle,
                    ),

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
                    onTap: () => buttonTapped(mathOperations[index]),
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



