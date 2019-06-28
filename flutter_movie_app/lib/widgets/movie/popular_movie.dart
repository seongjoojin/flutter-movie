import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_movie_app/models/movie/popular_movies_data.dart';
import 'package:flutter_movie_app/util/const.dart';
import 'package:flutter_movie_app/widgets/common/movie_item.dart';
import 'package:flutter_movie_app/widgets/common/section_title.dart';
import 'package:http/http.dart' as http;

class PopularMovie extends StatefulWidget {
  @override
  _PopularMovieState createState() => _PopularMovieState();
}

class _PopularMovieState extends State<PopularMovie> {
  PopularMoviesData _popularMoviesData;

  Future<PopularMoviesData> fetchData() async {
    var response = await http.get(
        '${Constants.apiUrl}movie/popular?api_key=d83f75862b4550f378bf4c8d57f57fc9&language=ko-KR&page=1');

    PopularMoviesData result =
        PopularMoviesData.fromJson(json.decode(response.body));

    return result;
  }

  @override
  void initState() {
    super.initState();
    fetchData().then((popularMoviesData) {
      setState(() {
        _popularMoviesData = popularMoviesData;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(left: 20),
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(color: Colors.black),
        child: _popularMoviesData == null
            ? Container(width: 0, height: 0)
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  SectionTitle(
                    title: 'Popular Movies',
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 3600,
                    child: new ListView.builder(
                        primary: false,
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        scrollDirection: Axis.vertical,
                        itemCount: _popularMoviesData == null
                            ? 0
                            : _popularMoviesData.results.length,
                        itemBuilder: (context, int index) {
                          Results popularMovieData =
                              _popularMoviesData.results[index];

                          return new Column(
                            children: <Widget>[
                              MovieItem(
                                id: popularMovieData.id,
                                title: popularMovieData.title,
                                voteAvg: popularMovieData.voteAverage,
                                overview: popularMovieData.overview,
                                posterPhoto: popularMovieData.posterPath,
                                isMovie: true,
                                horizontal: true,
                              )
                            ],
                          );
                        }),
                  )
                ],
              ));
  }
}
