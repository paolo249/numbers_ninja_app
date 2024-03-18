import 'package:flutter/material.dart';

import '../const.dart';

class MyButton extends StatelessWidget {
  final String child;
  const MyButton({Key? key, required this.child}) : super(key:key);

  @override
  Widget build(BuildContext context) {
    return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                       color: Colors.red[500],
                       borderRadius: BorderRadius.circular(4),
                    ),
                   
                    child: Center(
                      child: Text(
                        child,
                        style: normalTextStyle,
                        ),
                    ),
                  ),
                );

  }


}