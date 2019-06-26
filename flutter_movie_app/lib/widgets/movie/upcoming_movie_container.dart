import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_movie_app/util/const.dart';
import 'package:flutter_movie_app/widgets/common/section_title.dart';
import 'package:flutter_movie_app/widgets/common/movie_item.dart';
import 'package:flutter_movie_app/models/movie/upcoming_movies_data.dart';

class UpcomingMovieContainer extends StatefulWidget {
  @override
  _UpcomingMovieContainerState createState() => _UpcomingMovieContainerState();
}

class _UpcomingMovieContainerState extends State<UpcomingMovieContainer> {
  UpcomingMoviesData _upcomingMoviesData;

  Future<UpcomingMoviesData> fetchData() async {
    var response =  await http.get('${Constants.apiUrl}upcoming?api_key=d83f75862b4550f378bf4c8d57f57fc9&language=ko_KR&page=1');

    UpcomingMoviesData result = UpcomingMoviesData.fromJson(json.decode(response.body));

    return result;
  }

  @override
  void initState() {
    super.initState();
    fetchData().then((upcomingMoviesData) {
      setState(() {
        _upcomingMoviesData = upcomingMoviesData;
        print(_upcomingMoviesData);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:  BoxDecoration(
        color: Colors.black
      ),
      child: _upcomingMoviesData == null
          ? Container(width: 0, height: 0)
          : Column(
            children: <Widget>[
              SectionTitle(
                  title: 'Upcoming Movies',
              ),
              ListView.builder(
                  primary: false,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: _upcomingMoviesData == null ? 0 : _upcomingMoviesData.results.length,
                  itemBuilder: (BuildContext context, int index) {
                    final item = _upcomingMoviesData.results[index];
                    return MovieItem(
                        id: item.id,
                        title: item.title,
                        voteAvg: item.voteAverage,
                        overview: item.overview,
                        posterPhoto: item.posterPath,
                        isMovie: true,
                        horizontal: false,
                        navigation: 'detail',
                      );
                  })
              ],
          )
      );
    }
}