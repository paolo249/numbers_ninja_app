import 'package:flutter/material.dart';

class show_user_score extends StatelessWidget {

const show_user_score({
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