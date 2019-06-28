import 'package:flutter/material.dart';

class SectionTitle extends StatelessWidget {
  SectionTitle({
    @required this.title,
  });

  final title;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        margin: EdgeInsets.only(bottom: 15, top: 20),
        child: Text('$title',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
            )),
      ),
    );
  }
}
