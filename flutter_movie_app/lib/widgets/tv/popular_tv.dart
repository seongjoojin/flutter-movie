import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_movie_app/models/tv/popular_tv_data.dart';
import 'package:flutter_movie_app/util/const.dart';
import 'package:flutter_movie_app/widgets/common/movie_item.dart';
import 'package:flutter_movie_app/widgets/common/section_title.dart';
import 'package:http/http.dart' as http;

class PopularTV extends StatefulWidget {
  @override
  _PopularTVState createState() => _PopularTVState();
}

class _PopularTVState extends State<PopularTV> {
  PopularTVData _popularTVData;

  Future<PopularTVData> fetchData() async {
    var response = await http.get(
        '${Constants.apiUrl}tv/top_rated?api_key=d83f75862b4550f378bf4c8d57f57fc9&language=ko-KR&page=1');

    PopularTVData result = PopularTVData.fromJson(json.decode(response.body));

    return result;
  }

  @override
  void initState() {
    super.initState();
    fetchData().then((popularTVData) {
      setState(() {
        _popularTVData = popularTVData;
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
        child: _popularTVData == null
            ? Container(width: 0, height: 0)
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  SectionTitle(
                    title: 'Popular',
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 188,
                    child: new ListView.builder(
                        primary: false,
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: _popularTVData == null
                            ? 0
                            : _popularTVData.results.length,
                        itemBuilder: (context, int index) {
                          Results popularTVData = _popularTVData.results[index];

                          return new Row(
                            children: <Widget>[
                              MovieItem(
                                id: popularTVData.id,
                                title: popularTVData.name,
                                voteAvg: popularTVData.voteAverage,
                                overview: popularTVData.overview,
                                posterPhoto: popularTVData.posterPath,
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
