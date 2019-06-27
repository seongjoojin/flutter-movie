import 'package:flutter/material.dart';
import 'package:flutter_movie_app/widgets/movie/movie_main_slider.dart';
import 'package:flutter_movie_app/widgets/movie/upcoming_movie.dart';
import 'package:flutter_movie_app/widgets/movie/popular_movie.dart';


class Movie extends StatefulWidget {
  @override
  _MovieState createState() => _MovieState();
}

class _MovieState extends State<Movie> {
  @override
  Widget build(BuildContext context) {
    return new Material(
        child: SingleChildScrollView(
            child:
              Container(
              decoration:  BoxDecoration(
                  color: Colors.black
              ),
              child: Column(
                children: <Widget>[
                  MovieMainSlider(),
                  UpcomingMovie(),
                  PopularMovie(),
                ],
              ),
            )
        )
    );
  }
}