import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_collection/shared_data.dart';
import 'package:flutter_collection/shop_sliders/clothes_model.dart';

class ShopSlider extends StatefulWidget {
  const ShopSlider({super.key});

  @override
  State<ShopSlider> createState() => _ShopSliderState();
}

class _ShopSliderState extends State<ShopSlider> {
  late PageController _pageController;
  int currentPage = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pageController =
        PageController(initialPage: currentPage, viewportFraction: 0.8);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: AnimatedContainer(
          duration: const Duration(seconds: 1),
          color: colors[currentPage],
          width: width(context),
          height: height(context),
          child: Column(
            children: [
              const SizedBox(height: 30),
              Row(
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(
                        Icons.arrow_back,
                        color: currentPage == 0 ? Colors.white : Colors.black87,
                      )),
                  Expanded(
                    child: Text(
                      "Find Your Coat",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontFamily: "Arial",
                          color:
                              currentPage == 0 ? Colors.white : Colors.black87,
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 40),
              AspectRatio(
                aspectRatio: 0.85,
                child: PageView.builder(
                    itemCount: dataList.length,
                    physics: const ClampingScrollPhysics(),
                    controller: _pageController,
                    onPageChanged: (value) {
                      print(value);
                      currentPage = value;
                      setState(() {});
                    },
                    itemBuilder: (context, index) {
                      return carouselView(index);
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget carouselView(int index) {
    return AnimatedBuilder(
      animation: _pageController,
      builder: (context, child) {
        double value = 0.0;
        if (_pageController.position.haveDimensions) {
          value = index.toDouble() - (_pageController.page ?? 0);
          value = (value * 0.070).clamp(-1, 1);
          print("value $value index $index");
        }
        return Transform.rotate(
          angle: pi * value,
          child: carouselCard(dataList[index]),
        );
      },
    );
  }

  Widget carouselCard(ClothesModel data) {
    return Column(
      children: <Widget>[
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Hero(
              tag: data.imageName,
              child: GestureDetector(
                onTap: () {
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (context) => DetailsScreen(data: data)));
                },
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                      image: DecorationImage(
                          image: AssetImage(
                            data.imageName,
                          ),
                          fit: BoxFit.fill),
                      boxShadow: const [
                        BoxShadow(
                            offset: Offset(0, 4),
                            blurRadius: 4,
                            color: Colors.black26)
                      ]),
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Text(
            data.title,
            style: TextStyle(
                color: currentPage == 0 ? Colors.white : Colors.black45,
                fontSize: 25,
                fontWeight: FontWeight.bold),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "\$ ${data.price.toInt()}",
            style: TextStyle(
                fontFamily: "Arial",
                color: currentPage == 0 ? Colors.white : Colors.black87,
                fontSize: 16,
                fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }

  List<Color> colors = [
    Colors.black,
    const Color.fromARGB(255, 221, 205, 136),
    const Color.fromARGB(255, 251, 171, 171),
    const Color.fromARGB(255, 253, 227, 95),
  ];
}
