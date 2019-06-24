import 'package:flutter/material.dart';
import 'package:flutter_movie_app/screens/main_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Movie App',
      theme: ThemeData(
        brightness: Brightness.dark,
      ),
      home: MainScreen(),
    );
  }
}

