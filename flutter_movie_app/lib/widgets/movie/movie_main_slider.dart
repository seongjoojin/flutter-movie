import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_movie_app/widgets/common/movie_slider.dart';
import 'package:flutter_movie_app/util/const.dart';
import 'package:flutter_movie_app/models/movie/now_playing_movies_data.dart';


class MovieMainSlider extends StatefulWidget {
  @override
  _MovieMainSliderState createState() => _MovieMainSliderState();
}

class _MovieMainSliderState extends State<MovieMainSlider> {
  NowPlayingMoviesData _nowPlayingMoviesData;

  Future<NowPlayingMoviesData> fetchData() async {
    var response =  await http.get('${Constants.apiUrl}movie/now_playing?api_key=d83f75862b4550f378bf4c8d57f57fc9&language=ko-KR&page=1');

    NowPlayingMoviesData result = NowPlayingMoviesData.fromJson(json.decode(response.body));

    return result;
  }
  

  @override
  void initState() {
    super.initState();
    fetchData().then((nowPlayingMoviesData) {
      setState(() {
        _nowPlayingMoviesData = nowPlayingMoviesData;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.black
      ),
      child: Center(
          child: _nowPlayingMoviesData == null
                    ? CircularProgressIndicator()
                    : Column(
                  children: [
                    CarouselSlider(
                        height: MediaQuery.of(context).size.height / 3,
                        autoPlay: true,
                        viewportFraction: 1.0,
                        pauseAutoPlayOnTouch: Duration(seconds: 10),
                        items: _nowPlayingMoviesData.results.map((data) {
                          return Builder(
                            builder: (BuildContext context) {
                              return Container(
                                    width: MediaQuery.of(context).size.width,
                                    height: MediaQuery.of(context).size.height / 4,
                                    decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: NetworkImage('${Constants.photoUrl+data.backdropPath}'),
                                      colorFilter: new ColorFilter.mode(Colors.black.withOpacity(0.6), BlendMode.darken),
                                      fit: BoxFit.cover,
                                    )
                                ),
                                child: MovieSlider(
                                  movieData: data,
                                )
                              );
                            }
                          );
                        }).toList()
                    ),
                  ],
                )
            ),
    );
  }
}