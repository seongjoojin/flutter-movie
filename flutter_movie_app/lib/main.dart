import 'package:flutter/material.dart';
import 'package:flutter_movie_app/screens/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MaterialApp(
        title: 'Flutter Movie App',
        theme: ThemeData(
          brightness: Brightness.dark,
        ),
        home: Home(),
      );
}
