import 'package:flutter/material.dart';
import 'package:tickema/Data/movieClass.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'package:tickema/Pages/pickPlace.dart';

class Description extends StatefulWidget {
  Description({this.movie});
  final Movie movie;
  _DescriptionState createState() => _DescriptionState();
}

class _DescriptionState extends State<Description>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation widthValue;
  Animation radiusValue;
  String buttonText;
  MaterialColor buttonColor;
  @override
  void initState() {
    buttonColor = Colors.grey;
    controller = new AnimationController(
        vsync: this, duration: Duration(milliseconds: 300));
    widthValue = new Tween(begin: 300.0, end: 50.0).animate(controller);
    radiusValue = new Tween(begin: 0.0, end: 50.0).animate(controller);
    buttonText = 'BUY TICKET';
    widthValue.addListener(() {
      setState(() {});
      if (controller.isCompleted) {
        Navigator.push(
            context,
            PageRouteBuilder(
                transitionDuration: Duration(milliseconds:700),
                pageBuilder: (context, _, __) => PlacePicker()));
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void clicked() {
    setState(() {
      buttonText = '';
    });

    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    String actors = '';
    for (String actor in widget.movie.actors) {
      actors = actor + ' , ' + actors;
    }
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Stack(
      children: <Widget>[
        AspectRatio(
          aspectRatio: width / height,
          child: Container(
            child: widget.movie.image,
          ),
        ),
        Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment(0.0, -0.2),
                  colors: [
                Colors.white,
                Colors.white.withOpacity(0.7),
                Colors.transparent
              ])),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Hero(
            tag: "${widget.movie.title}",
            child: Container(
              height: height * 0.8,
              width: width,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(50))),
            ),
          ),
        ),
        Align(
          alignment: Alignment(0, -0.7),
          child: Hero(
            tag: '${widget.movie.title}5',
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              child: Container(
                  width: 110,
                  child: AspectRatio(
                    aspectRatio: 0.9,
                    child: widget.movie.image,
                  )),
            ),
          ),
        ),
        Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: EdgeInsets.all(20),
              width: width,
              height: height * 0.72,
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    Hero(
                        tag: '${widget.movie.title}4',
                        child: Material(
                            type: MaterialType.transparency,
                            child: Column(
                              children: <Widget>[
                                Container(
                                  margin: EdgeInsets.symmetric(vertical: 12),
                                  child: Text(
                                    widget.movie.title,
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: widget.movie.children),
                              ],
                            ))),
                    SizedBox(
                      height: 10,
                    ),
                    Hero(
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Material(
                              type: MaterialType.transparency,
                              child: Text(widget.movie.rating.toString()),
                            ),
                            SmoothStarRating(
                              size: 20,
                              spacing: 3,
                              borderColor: Colors.grey,
                              rating: widget.movie.rating / 2,
                              color: Colors.yellow[700],
                            )
                          ]),
                      tag: "${widget.movie.title}rating",
                    ),
                    Hero(
                      tag: 'info',
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          RichText(
                              text: TextSpan(
                                  style: TextStyle(color: Colors.black),
                                  children: [
                                TextSpan(
                                    text: 'Actors\n\n',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w700),
                                    children: [
                                      TextSpan(
                                          text: actors,
                                          style: TextStyle(
                                              color: Colors.grey,
                                              fontSize: 15,
                                              fontWeight: FontWeight.w400))
                                    ]),
                                TextSpan(
                                    text: '\n\n\nDescription\n\n',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w700),
                                    children: [
                                      TextSpan(
                                          text: widget.movie.description,
                                          style: TextStyle(
                                              color: Colors.grey,
                                              fontSize: 15,
                                              fontWeight: FontWeight.w400))
                                    ])
                              ])),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )),
        Align(
          alignment: Alignment(0, 0.9),
          child: Hero(
              tag: 'placePicker',
              child: Container(
                height: height * 0.07,
                width: 50,
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.all(Radius.circular(50))),
              )),
        ),
        Align(
          alignment: Alignment(0, 0.9),
          child: GestureDetector(
            onTap: clicked,
            child: Hero(
              tag: 'button',
              child: Container(
                  height: height * 0.07,
                  width: widthValue.value,
                  decoration: BoxDecoration(
                      color: buttonColor,
                      borderRadius:
                          BorderRadius.all(Radius.circular(radiusValue.value))),
                  child: Center(
                      child: Material(
                    type: MaterialType.transparency,
                    child: Text(buttonText,
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 17)),
                  ))),
            ),
          ),
        ),
      ],
    );
  }
}
