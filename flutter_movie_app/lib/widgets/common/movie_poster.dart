import 'package:flutter/material.dart';
import 'package:flutter_movie_app/util/const.dart';

class MoviePoster extends StatelessWidget {
  MoviePoster({@required this.path});

  final path;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 110,
      height: 160,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(2.5)),
          image: DecorationImage(
            image: NetworkImage('${Constants.photoUrl + path}'),
            fit: BoxFit.cover,
          )),
    );
  }
}
