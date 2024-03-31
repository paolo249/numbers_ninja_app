import 'package:flutter/material.dart';

class updateUserScore extends StatelessWidget {

const updateUserScore({
  super.key, 
  required this.userScore,
  });

  final int userScore;
  

 

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 500, 
     child:   
     Text('Score: $userScore', style: const TextStyle(fontSize: 20, color: Colors.black)),
    );
  }
}