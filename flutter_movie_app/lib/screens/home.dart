import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_movie_app/screens/movie.dart';
import 'package:flutter_movie_app/screens/search.dart';
import 'package:flutter_movie_app/screens/tv.dart';
import 'package:flutter_movie_app/util/const.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;
  final List<Widget> _children = [Movie(), TV(), Search()];
  final List<String> _listTitleText = ['Movies', 'TV', 'Search'];

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Movie App',
        theme: new ThemeData(
            brightness: Brightness.dark, backgroundColor: Colors.black),
        home: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            title: Text("${_listTitleText[_currentIndex]}"),
            brightness: Brightness.dark,
            backgroundColor: Colors.black,
            textTheme: TextTheme(title: TextStyle(fontSize: 18.0)),
          ),
          body: Container(
              decoration: BoxDecoration(color: Colors.black),
              child: _children[_currentIndex]),
          bottomNavigationBar: BottomNavigationBar(
            onTap: onTabTapped,
            currentIndex: _currentIndex,
            items: [
              BottomNavigationBarItem(
                title: Text('Movie'),
                icon: Icon(Icons.movie),
              ),
              BottomNavigationBarItem(title: Text('TV'), icon: Icon(Icons.tv)),
              BottomNavigationBarItem(
                  title: Text('Search'), icon: Icon(Icons.search))
            ],
            backgroundColor: Colors.black,
            selectedItemColor: Colors.white,
            unselectedItemColor: Constants.greyColor,
          ),
        ));
  }
}
