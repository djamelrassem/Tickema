import 'package:flutter/material.dart';
import 'package:tickema/Data/movieClass.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class Description extends StatefulWidget {
  Description({this.movie});
  final Movie movie;
  _DescriptionState createState() => _DescriptionState();
}

class _DescriptionState extends State<Description> {
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
            alignment: Alignment(0, -0.3),
            child: Container(
              height: 100,
              child: Hero(
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
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          ),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: widget.movie.children),
                        ],
                      ))),
            )),
        Align(
          alignment: Alignment(0,-0.15),
          child: Hero(
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
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
        ),
        Align(
            alignment: Alignment.bottomCenter,
            child: Hero(
              tag: 'info',
              child: Container(
                  padding: EdgeInsets.all(20),
                  width: width,
                  height: height * 0.57,
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
                                    fontSize: 20, fontWeight: FontWeight.w700),
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
                                    fontSize: 20, fontWeight: FontWeight.w700),
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
                  )),
            )),
        Align(
          alignment: Alignment(0, 0.9),
          child: Hero(
              child: Container(
                  height: MediaQuery.of(context).size.height * 0.07,
                  width: MediaQuery.of(context).size.width * 0.7,
                  color: Colors.grey,
                  child: Center(
                      child: Material(
                    type: MaterialType.transparency,
                    child: Text('BUY TICKET',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 17)),
                  ))),
              tag: 'button'),
        ),
      ],
    );
  }
}
