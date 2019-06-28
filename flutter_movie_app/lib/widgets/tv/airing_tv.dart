import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_movie_app/models/tv/airing_tv_data.dart';
import 'package:flutter_movie_app/util/const.dart';
import 'package:flutter_movie_app/widgets/common/movie_item.dart';
import 'package:flutter_movie_app/widgets/common/section_title.dart';
import 'package:http/http.dart' as http;

class AiringTV extends StatefulWidget {
  @override
  _AiringTVState createState() => _AiringTVState();
}

class _AiringTVState extends State<AiringTV> {
  AiringTVData _airingTVData;

  Future<AiringTVData> fetchData() async {
    var response = await http.get(
        '${Constants.apiUrl}tv/airing_today?api_key=d83f75862b4550f378bf4c8d57f57fc9&language=ko-KR&page=1');

    AiringTVData result = AiringTVData.fromJson(json.decode(response.body));

    return result;
  }

  @override
  void initState() {
    super.initState();
    fetchData().then((airingTVData) {
      setState(() {
        _airingTVData = airingTVData;
      });
    });
  }

  @override
  Widget build(BuildContext context) => Container(
      padding: EdgeInsets.only(left: 20),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(color: Colors.black),
      child: SingleChildScrollView(
          child: ConstrainedBox(
        constraints: BoxConstraints(),
        child: _airingTVData == null
            ? Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 2,
                alignment: Alignment(0.0, 0.0),
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: CircularProgressIndicator(),
                ))
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  SectionTitle(
                    title: 'Airing Today',
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 188,
                    child: new ListView.builder(
                        primary: false,
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: _airingTVData == null
                            ? 0
                            : _airingTVData.results.length,
                        itemBuilder: (context, int index) {
                          Results upcomingMovieData =
                              _airingTVData.results[index];

                          return new Row(
                            children: <Widget>[
                              MovieItem(
                                id: upcomingMovieData.id,
                                title: upcomingMovieData.name,
                                voteAvg: upcomingMovieData.voteAverage,
                                overview: upcomingMovieData.overview,
                                posterPhoto: upcomingMovieData.posterPath,
                                isMovie: false,
                                horizontal: false,
                              )
                            ],
                          );
                        }),
                  )
                ],
              ),
      )));
}
