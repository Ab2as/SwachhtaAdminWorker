import 'package:flutter/material.dart';
import 'package:swachhta_app2/data/dummy_data.dart';
import 'package:swachhta_app2/news/news_tile.dart';


class PendingWidget extends StatefulWidget{
  PendingWidget({super.key, required this.itemCount});

  var itemCount;

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _PendingWidget();
  }
}

class _PendingWidget extends State<PendingWidget>{
  var _index=0;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return PageView.builder(
      itemCount: widget.itemCount,
      controller: PageController(viewportFraction: 0.8),
      onPageChanged: (index) => setState(() => _index = index),
      itemBuilder: (context, index) {
        return AnimatedPadding(
          duration: const Duration(milliseconds: 400),
          curve: Curves.fastOutSlowIn,
          padding: EdgeInsets.all(_index == index ? 0.0 : 8.0),
          child: Card(
            elevation: 4,
            color: Colors.white10,
            child: Center(child: Text("Card $_index")),
          ),
        );
      },
    );
  }
}