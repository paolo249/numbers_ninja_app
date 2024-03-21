import 'package:flutter/material.dart';
import 'package:numbers_ninja_app/const.dart';

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
