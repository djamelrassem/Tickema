import 'package:flutter/material.dart';

class PlacePicker extends StatefulWidget {
  @override
  _PlacePicker createState() => _PlacePicker();
}

class _PlacePicker extends State<PlacePicker> {
  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'placePicker',
      child: Scaffold(
        body: Container(color: Colors.black),
      ),
    );
  }
}
