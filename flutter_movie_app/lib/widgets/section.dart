import 'package:flutter/material.dart';

class Section extends StatelessWidget {
  Section({
    @required this.title,
    @required this.children,
    @required this.horizontal
  });

  final title;
  final children;
  final horizontal;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 20, 0, 20),
      child: Row(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(left:20),
            margin: EdgeInsets.only(bottom: 15),
            child: Text(
              '$title',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
              )
            ),
          ),
          Container(
            child: SingleChildScrollView(
              child: children
            ),
          )
        ],
      ),
    );
  }
}
