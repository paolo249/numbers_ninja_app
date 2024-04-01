import 'package:flutter/material.dart';
import 'const.dart';

// ignore: must_be_immutable
class MyButton extends StatelessWidget {
  final String child;
  final VoidCallback onTap;
  final double width;
  final double height;
  var buttonColor = Colors.red[500];

  MyButton({
    super.key, 
    required this.child,
    required this.onTap,
    this.width = 100.0, // Default width
    this.height = 50.0, // Default height
    });

  @override
  Widget build(BuildContext context) {


    return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: onTap,
                    child: Container(
                      decoration: BoxDecoration(
                         color: buttonColor,
                         borderRadius: BorderRadius.circular(4),
                      ),
                     
                      child: Center(
                        child: Text(
                          child,
                          style: normalTextStyle,
                          ),
                      ),
                    ),
                  ),
                );

  }


}