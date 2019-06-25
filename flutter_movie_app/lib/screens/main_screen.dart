import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_movie_app/models/movie/upcoming_movies_result.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_movie_app/widgets/movie_slider.dart';
import 'package:flutter_movie_app/util/const.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  UpcomingMoviesData _upcomingMoviesData;

  Future<UpcomingMoviesData> fetchData() async {
    var response =  await http.get('${Constants.apiUrl}upcoming?api_key=d83f75862b4550f378bf4c8d57f57fc9&language=ko-KR&page=1');

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
    return MaterialApp(
        home: Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: AppBar(
              title: Text("Movies"),
              brightness: Brightness.dark,
              backgroundColor: Colors.black,
              textTheme: TextTheme(
                  title: TextStyle(
                      fontSize: 18.0
                  )
              ),
            ),
            body: Center(
                child: _upcomingMoviesData == null
                    ? CircularProgressIndicator()
                    : Column(
                  children: [
                    CarouselSlider(
                        height: MediaQuery.of(context).size.height / 3,
                        autoPlay: true,
                        viewportFraction: 1.0,
                        pauseAutoPlayOnTouch: Duration(seconds: 10),
                        items: _upcomingMoviesData.results.map((data) {
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
            )
        )
    );
  }
}