import 'package:flutter/material.dart';

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
        child: TextField(
            autofocus: true,
            controller: searchController,
            onChanged: (v) => searchController.text = v,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: 'Search movies and tv',
            )));
  }
}
