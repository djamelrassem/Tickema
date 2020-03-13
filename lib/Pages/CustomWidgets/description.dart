import 'package:flutter/material.dart';
import 'package:tickema/Data/movieClass.dart';

class Description extends StatefulWidget {
  Description({this.movie});
  final Movie movie;
  _DescriptionState createState() => _DescriptionState();
}

class _DescriptionState extends State<Description> {
  @override
  Widget build(BuildContext context) {
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
            tag: widget.movie.title,
            child: Container(
              height: height * 0.7,
              width: width,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(50))),
              child: Column(),
            ),
          ),
        ),
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
        Align(
          alignment: Alignment(0, -0.7),
          child: Hero(
            tag: '${widget.movie.title}5',
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              child: Container(
                  width: 100,
                  child: AspectRatio(
                    aspectRatio: 0.9,
                    child: widget.movie.image,
                  )),
            ),
          ),
        )
      ],
    );
  }
}
