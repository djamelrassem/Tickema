import 'package:flutter/material.dart';
import 'package:tickema/Data/movieClass.dart';

class TicketContainer extends StatelessWidget {
  TicketContainer({this.radius, this.image, this.title, this.movie});
  final double radius;
  final Image image;
  final String title;
  final Movie movie;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Hero(
          tag: movie.title,
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 15),
            padding: EdgeInsets.all(25),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(radius * 1.5),
                  topRight: Radius.circular(radius * 1.5)),
            ),
          ),
        ),
        Column(
          children: <Widget>[
            SizedBox(
              height: 20,
            ),
            ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(radius)),
              child: Container(
                  width: 180,
                  child: AspectRatio(
                    aspectRatio: 0.9,
                    child: image,
                  )),
            ),
            Hero(
                tag: '${movie.title}4',
                child: Material(
                    type: MaterialType.transparency,
                    child: Column(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 12),
                          child: Text(
                            title,
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: movie.children)
                      ],
                    )))
          ],
        )
      ],
    );
  }
}
