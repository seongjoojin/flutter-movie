import 'package:flutter/material.dart';
import 'package:flutter_movie_app/util/const.dart';

class Overview extends StatelessWidget {
  Overview({@required this.overviewData, @required this.inSlide});

  final overviewData;
  final inSlide;

  @override
  Widget build(BuildContext context) {
    return Text(
      overviewData.length > (inSlide ? 120 : 150)
          ? '${overviewData.substring(0, (inSlide ? 117 : 147))}...'
          : '$overviewData',
      style: TextStyle(
        color: Constants.tintColor,
        fontSize: 12,
      ),
    );
  }
}
