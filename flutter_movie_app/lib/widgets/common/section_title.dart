import 'package:flutter/material.dart';

class SectionTitle extends StatelessWidget {
  SectionTitle({
    @required this.title,
  });

  final title;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 20, 0, 20),
      child: 
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
      );
  }
}
