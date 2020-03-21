import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PlacePicker extends StatefulWidget {
  @override
  _PlacePicker createState() => _PlacePicker();
}

class _PlacePicker extends State<PlacePicker> with TickerProviderStateMixin {
  AnimationController controller;
  Animation animation;
  @override
  void initState() {
    controller = new AnimationController(
        duration: Duration(milliseconds: 1000), vsync: this);
    animation = new Tween(begin: 0.0, end: 20.0).animate(controller);
    controller.forward();
    animation.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'placePicker',
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 50,
            ),
            Container(
                margin: EdgeInsets.only(left: 20),
                child: Text(
                  'Pick a Place',
                  style: GoogleFonts.roboto(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 40),
                )),
            IconButton(
                icon: Icon(
                  Icons.personal_video,
                  size: animation.value,
                  color: Colors.white,
                ),
                onPressed: null)
          ],
        ),
      ),
    );
  }
}
