import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:tickema/Data/movieClass.dart';
import 'package:tickema/Pages/CustomWidgets/description.dart';
import 'package:tickema/Pages/CustomWidgets/reverseScroller.dart';
import 'package:tickema/Pages/CustomWidgets/ticketContainer.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    List<Container> backgrounds = [];
    List<Widget> tickets = [];
    for (Movie movie in movies) {
      backgrounds.add(new Container(
        child: movie.image,
      ));
      tickets.add(new Hero(
        tag: movie.title,
        child: TicketContainer(
          image: movie.image,
          radius: 20,
          title: movie.title,
          movie: movie,
        ),
      ));
    }

    ReversePageScroller scroller = ReversePageScroller(
      backgroundChildren: backgrounds,
      frontChildren: tickets,
      percent: 0.7,
      reverseScrolling: true,
      frontController: new PageController(
          initialPage: backgrounds.length ~/ 2, viewportFraction: 0.7),
    );

    return Scaffold(
        body: Stack(
      children: <Widget>[
        scroller,
        Align(
          alignment: Alignment(0, 0.9),
          child: InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  PageRouteBuilder(
                      pageBuilder: (context, _, __) => Description(
                            movie:
                                movies[scroller.frontController.page.toInt()],
                          )));
            },
            child: Hero(
              tag: 'button',
              child: Container(
                  height: MediaQuery.of(context).size.height * 0.07,
                  width: MediaQuery.of(context).size.width * 0.55,
                  color: Colors.grey,
                  child: Center(
                      child: Material(
                          type: MaterialType.transparency,
                          child: Text('BUY TICKET',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17))))),
            ),
          ),
        )
      ],
    ));
  }
}
