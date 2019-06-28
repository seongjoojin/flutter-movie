import 'package:flutter/material.dart';
import 'package:flutter_movie_app/util/const.dart';

class MovieRating extends StatelessWidget {
  MovieRating({@required this.votes, @required this.inSlide});

  final votes;
  final inSlide;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: votes > 0
          ? Text(
              '⭐ $votes',
              style: TextStyle(
                  color: inSlide ? Constants.tintColor : Constants.greyColor,
                  fontWeight: FontWeight.w600,
                  fontSize: inSlide ? 10 : 8),
            )
          : Text(
              '⭐ 0',
              style: TextStyle(
                  color: inSlide ? Constants.tintColor : Constants.greyColor,
                  fontWeight: FontWeight.w600,
                  fontSize: inSlide ? 10 : 8),
            ),
    );
  }
}
