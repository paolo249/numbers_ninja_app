import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:numbers_ninja_app/widgets/quiz_screen.dart';
import 'package:numbers_ninja_app/widgets/menu_screen.dart';



void main() {
  // Checks for error before running app
  FlutterError.onError = (details) {
    FlutterError.presentError(details);
    if (kReleaseMode) exit(1);
  };
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        "/": (context) => Menu(),
        "/quiz": (context) => const quiz_screen(),
      },
      title: 'Number Ninja App',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme:
            ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 133, 34, 255)),
      ),
      initialRoute: "/",
    );
  }
}

// Icebox item #2
// class UserCreateScreen extends StatelessWidget {
//   const UserCreateScreen({
//     super.key,
//   });
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold();
//   }
// }
// class GameOverScreen extends StatelessWidget {
//   const GameOverScreen({
//     super.key,
//   });
//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context);
//     final style = theme.textTheme.bodyLarge!.copyWith(
//       color: theme.colorScheme.onPrimary,
//     );
//     return Card(
//       color: theme.colorScheme.primary,
//       child: Padding(
//         padding: const EdgeInsets.all(20),
//       ),
//     );
//   }
// }
