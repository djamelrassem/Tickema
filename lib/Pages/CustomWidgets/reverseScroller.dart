import 'package:flutter/material.dart';

class ReversePageScroller extends StatefulWidget {
  ReversePageScroller(
      {Key key,
      @required this.backgroundChildren,
      @required this.frontChildren,
      @required this.percent,
      @required this.reverseScrolling,
      @required this.frontController})
      : assert(backgroundChildren.length == frontChildren.length),
        assert(backgroundChildren != null && frontChildren != null),
        assert((percent < 1.0) && (percent > 0)),
        assert(frontController != null),
        super(key: key);
  final List<Widget> backgroundChildren;
  final List<Widget> frontChildren;
  final double percent;
  final bool reverseScrolling;
  final PageController frontController;
  @override
  _ReversePageScrollerState createState() => _ReversePageScrollerState();
}

class _ReversePageScrollerState extends State<ReversePageScroller> {
  PageController backgroundController;

  @override
  void initState() {
    int length = widget.backgroundChildren.length;
    backgroundController = new PageController(
      viewportFraction: 1.0,
      initialPage: ((length) ~/ 2),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    widget.frontController.addListener(() {
      backgroundController.position.forcePixels(
          widget.frontController.position.pixels /
              widget.frontController.viewportFraction);
    });
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    List<Widget> children = [
      PageView.builder(
        reverse: widget.reverseScrolling,
        controller: backgroundController,
        itemCount: widget.backgroundChildren.length,
        itemBuilder: (context, index) =>
            Container(child: widget.backgroundChildren[index]),
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
      Container(
        height: height * widget.percent,
        child : PageView.builder(
            controller: widget.frontController,
            itemCount: widget.frontChildren.length,
            itemBuilder: (context, index) =>
                Container(child: widget.frontChildren[index]),
          ),
       
      )
    ];
    return Stack(alignment: Alignment.bottomCenter, children: children);
  }
}
