import 'package:flutter/material.dart';
import 'package:flutter_movie_app/util/const.dart';
import 'package:flutter_movie_app/widgets/common/movie_poster.dart';
import 'package:flutter_movie_app/widgets/common/movie_rating.dart';
import 'package:flutter_movie_app/widgets/common/overview.dart';

class MovieSlider extends StatelessWidget {
  MovieSlider({@required this.movieData});

  final movieData;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          MoviePoster(path: movieData.posterPath),
          Container(
            width: MediaQuery.of(context).size.width / 2,
            child: Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    '${movieData.title}',
                    style: TextStyle(
                      color: Constants.tintColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 10),
                  MovieRating(votes: movieData.voteAverage, inSlide: true),
                  const SizedBox(height: 10),
                  Overview(overviewData: movieData.overview, inSlide: true),
                  ButtonTheme(
                    minWidth: 64.0,
                    height: 32.0,
                    child: RaisedButton(
                      onPressed: () {},
                      color: Color(0xffe74c3c),
                      textColor: Colors.white,
                      padding: const EdgeInsets.all(0.0),
                      child: Container(
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(2.5)),
                        ),
                        child: const Text(
                          '더 보기',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
