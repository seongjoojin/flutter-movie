import 'package:flutter/material.dart';
import 'package:flutter_movie_app/widgets/movie/movie_main_slider.dart';
import 'package:flutter_movie_app/widgets/movie/upcoming_movie_container.dart';


class Movie extends StatefulWidget {
  @override
  _MovieState createState() => _MovieState();
}

class _MovieState extends State<Movie> {
  @override
  Widget build(BuildContext context) {
    return new Material(
        child: new SingleChildScrollView(
          child: new ConstrainedBox(
            constraints: new BoxConstraints(),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                MovieMainSlider(),
                UpcomingMovieContainer(),
              ],
            )
          ))
    );
  }
}