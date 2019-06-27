import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_movie_app/util/const.dart';
import 'package:flutter_movie_app/widgets/common/section_title.dart';
import 'package:flutter_movie_app/widgets/common/movie_item.dart';
import 'package:flutter_movie_app/models/movie/upcoming_movies_data.dart';

class UpcomingMovie extends StatefulWidget {
  @override
  _UpcomingMovieState createState() => _UpcomingMovieState();
}

class _UpcomingMovieState extends State<UpcomingMovie> {
  UpcomingMoviesData _upcomingMoviesData;

  Future<UpcomingMoviesData> fetchData() async {
    var response =  await http.get('${Constants.apiUrl}movie/upcoming?api_key=d83f75862b4550f378bf4c8d57f57fc9&language=ko-KR&page=1');

    UpcomingMoviesData result = UpcomingMoviesData.fromJson(json.decode(response.body));

    return result;
  }

  @override
  void initState() {
    super.initState();
    fetchData().then((upcomingMoviesData) {
      setState(() {
        _upcomingMoviesData = upcomingMoviesData;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 20),
      width: MediaQuery.of(context).size.width,
      decoration:  BoxDecoration(
        color: Colors.black
      ),
      child: new SingleChildScrollView(
          child: new ConstrainedBox(
            constraints: new BoxConstraints(),
            child: _upcomingMoviesData == null
                ? Container(width: 0, height: 0)
                : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    SectionTitle(
                      title: 'Upcoming Movies',
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 188,
                      child: new ListView.builder(
                          primary: false,
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: _upcomingMoviesData == null ? 0 : _upcomingMoviesData.results.length,
                          itemBuilder: (context, int index) {
                            Results upcomingMovieData = _upcomingMoviesData.results[index];

                            return new Row(
                              children: <Widget>[
                                MovieItem(
                                  id: upcomingMovieData.id,
                                  title: upcomingMovieData.title,
                                  voteAvg: upcomingMovieData.voteAverage,
                                  overview: upcomingMovieData.overview,
                                  posterPhoto: upcomingMovieData.posterPath,
                                  isMovie: true,
                                  horizontal: false,
                                )
                              ],
                            );
                          }
                      ),
                    )
                  ],
            ),
          )
      )
    );
  }
}