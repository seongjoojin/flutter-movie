import 'package:flutter/material.dart';
import 'package:flutter_movie_app/widgets/tv/airing_tv.dart';
import 'package:flutter_movie_app/widgets/tv/popular_tv.dart';
import 'package:flutter_movie_app/widgets/tv/top_rated_tv.dart';

class TV extends StatefulWidget {
  @override
  _TVState createState() => _TVState();
}

class _TVState extends State<TV> {
  @override
  Widget build(BuildContext context) {
    return Material(
        child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Container(
              decoration: BoxDecoration(color: Colors.black),
              child: Column(
                children: <Widget>[AiringTV(), TopRatedTV(), PopularTV()],
              ),
            )));
  }
}
