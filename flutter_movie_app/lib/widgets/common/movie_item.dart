import 'package:flutter/material.dart';
import 'package:flutter_movie_app/widgets/common/movie_poster.dart';
import 'package:flutter_movie_app/widgets/common/movie_rating.dart';
import 'package:flutter_movie_app/widgets/common/overview.dart';

class MovieItem extends StatelessWidget {
  MovieItem({
    @required this.id,
    @required this.posterPhoto,
    @required this.title,
    @required this.voteAvg,
    @required this.horizontal,
    @required this.overview,
    @required this.isMovie,
    @required this.navigation
  });
  final id;
  final posterPhoto;
  final title;
  final voteAvg;
  final horizontal;
  final overview;
  final isMovie;
  final navigation;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {},
        child: horizontal ?
          Container(
            margin: EdgeInsets.only(bottom: 20),
            child: Column(
              children: <Widget>[
                MoviePoster(path: posterPhoto),
                Container(
                  width: MediaQuery.of(context).size.height / 1,
                  margin: EdgeInsets.only(left: 20),
                  child: Row(
                    children: <Widget>[
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        '$title',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      MovieRating(votes: voteAvg, inSlide: false),
                      Overview(overviewData: overview, inSlide: false),
                    ],
                  ),
                )
              ],
            ),
          ) : Container(
            margin: EdgeInsets.only(right: 20),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                MoviePoster(path: posterPhoto),
                Text(
                  title.length > 15 ? '${title.substring(0, 12)}...' : '$title',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                  ),
                ),
                MovieRating(votes: voteAvg, inSlide: false),
              ],
            ),
          )
        ,
      );
  }
}
