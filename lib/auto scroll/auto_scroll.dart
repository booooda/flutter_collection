import 'package:flutter/material.dart';
import 'package:flutter_collection/auto%20scroll/data.dart';

import 'movies_listView.dart';

// ignore: use_key_in_widget_constructors
class AutoScroll extends StatefulWidget {
  @override
  State<AutoScroll> createState() => _AutoScrollState();
}

class _AutoScrollState extends State<AutoScroll> {
  final ScrollController _scrollController1 = ScrollController();
  final ScrollController _scrollController2 = ScrollController();
  final ScrollController _scrollController3 = ScrollController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      double minScrollExtent1 = _scrollController1.position.minScrollExtent;
      double maxScrollExtent1 = _scrollController1.position.maxScrollExtent;
      double minScrollExtent2 = _scrollController1.position.minScrollExtent;
      double maxScrollExtent2 = _scrollController1.position.maxScrollExtent;
      double minScrollExtent3 = _scrollController1.position.minScrollExtent;
      double maxScrollExtent3 = _scrollController1.position.maxScrollExtent;

      animateToMaxMi(maxScrollExtent1, minScrollExtent1, maxScrollExtent1, 25,
          _scrollController1);
      animateToMaxMi(maxScrollExtent2, minScrollExtent2, maxScrollExtent2, 15,
          _scrollController2);
      animateToMaxMi(maxScrollExtent3, minScrollExtent3, maxScrollExtent3, 10,
          _scrollController3);
    });
  }

  animateToMaxMi(double max, double min, double direction, int seconds,
      ScrollController scrollController) {
    scrollController
        .animateTo(direction,
            duration: Duration(seconds: seconds), curve: Curves.linear)
        .then((value) {
      direction = direction == max ? min : max;
      animateToMaxMi(max, min, direction, seconds, scrollController);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                MoviesListView(
                    scrollController: _scrollController1, images: movies1),
                MoviesListView(
                    scrollController: _scrollController2, images: movies2),
                MoviesListView(
                    scrollController: _scrollController3, images: movies3),
              ],
            ),
            const Text(
              'Comming Soon !',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w600,
              ),
            ),
            Material(
              elevation: 0,
              color: Colors.blue,
              borderRadius: BorderRadius.circular(20),
              child: MaterialButton(
                  minWidth: 240,
                  height: 60,
                  padding: EdgeInsets.all(10),
                  onPressed: () {},
                  child: const Text(
                    'Continue',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
