import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_movie_app/models/movie/upcoming_movies_result.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_movie_app/util/const.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  UpcomingMoviesData _upcomingMoviesData;

  Future<UpcomingMoviesData> fetchData() async {
    var response =  await http.get('https://api.themoviedb.org/3/movie/upcoming?api_key=d83f75862b4550f378bf4c8d57f57fc9&language=ko-KR&page=1');

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
                      items: _upcomingMoviesData.results.map((data) {
                        print(data.id);
                        return Builder(
                          builder: (BuildContext context) {
                            return Container(
                                width: MediaQuery.of(context).size.width,
                                height: MediaQuery.of(context).size.height / 4,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: NetworkImage('https://image.tmdb.org/t/p/w500/${data.backdropPath}'),
                                        colorFilter: new ColorFilter.mode(Colors.black.withOpacity(0.6), BlendMode.darken),
                                        fit: BoxFit.cover,
                                    )
                                ),
                              child: Padding(
                                padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      width: 110,
                                      height: 160,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(Radius.circular(2.5)),
                                        image: DecorationImage(
                                          image: NetworkImage('https://image.tmdb.org/t/p/w500/${data.posterPath}'),
                                          fit: BoxFit.cover,
                                        )
                                      ),
                                    ),
                                    Container(
                                      width: MediaQuery.of(context).size.width / 2,
                                      child: Padding(
                                        padding: const EdgeInsets.only(left: 16.0),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: <Widget>[
                                             Text(
                                                '${data.title}',
                                                style: TextStyle(
                                                  color: Constants.tintColor,
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 14,
                                                ),
                                            ),
                                            const SizedBox(height: 10),
                                            data.voteAverage > 0 ?
                                                Text(
                                                  '⭐ ${data.voteAverage}',
                                                  style: TextStyle(
                                                    color: Constants.tintColor,
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 10
                                                  ),
                                                )
                                                : Text(
                                                  '⭐ 0',
                                                  style: TextStyle(
                                                      color: Constants.tintColor,
                                                      fontWeight: FontWeight.w600,
                                                      fontSize: 10
                                                  ),
                                                ),
                                            const SizedBox(height: 10),
                                            Text(
                                              data.overview.length > 120 ?
                                              '${data.overview.substring(0, 117)}...' : '${data.overview}' ,
                                              style: TextStyle(
                                                color: Constants.tintColor,
                                                fontSize: 12,
                                              ),
                                            ),
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
                              ),
                            );
                          },
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