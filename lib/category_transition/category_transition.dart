import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_collection/category_transition/item.dart';
import 'package:flutter_collection/shared_data.dart';

class CategoryTransition extends StatefulWidget {
  const CategoryTransition({super.key});

  @override
  State<CategoryTransition> createState() => _CategoryTransitionState();
}

class _CategoryTransitionState extends State<CategoryTransition>
    with TickerProviderStateMixin {
  bool hideBarContent = false;
  bool changeBarALign = false;
  bool fillHeight = false;
  bool showCat = false;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          color: Colors.white,
          width: width(context),
          height: height(context),
          child: SingleChildScrollView(
            child: Column(children: [
              if (!fillHeight)
                Container(
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 12),
                  alignment: AlignmentDirectional.centerStart,
                  child: Text(
                    'hi, abdelrahman',
                    style: TextStyle(
                        color: const Color.fromARGB(255, 38, 105, 40),
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              AnimatedContainer(
                alignment: (changeBarALign)
                    ? Alignment.topCenter
                    : Alignment.bottomCenter,
                padding: EdgeInsets.symmetric(vertical: 20),
                duration: Duration(milliseconds: 500),
                height:
                    fillHeight ? height(context) * .9 : height(context) * .23,
                width: width(context) * .95,
                decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(20)),
                child: Stack(
                  children: [
                    if (!hideBarContent)
                      Positioned(
                        top: 0,
                        child: SizedBox(
                          width: width(context) * .95,
                          height: 100,
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: TextField(
                                decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(10)),
                              hintText: 'Search',
                              prefixIcon: Icon(Icons.search),
                              filled: true,
                              fillColor: Colors.white,
                            )),
                          ),
                        ),
                      ),
                    AnimatedAlign(
                      alignment: changeBarALign
                          ? AlignmentDirectional.topCenter
                          : AlignmentDirectional.bottomCenter,
                      duration: Duration(milliseconds: 250),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Item(
                            iconData: Icons.access_time_filled_rounded,
                          ),
                          Item(
                            iconData: Icons.account_balance_wallet_rounded,
                          ),
                          Item(
                            iconData: Icons.add_business_rounded,
                          ),
                          Item(
                            iconData: Icons.window,
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      width: width(context),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 30),
                        child: AnimatedSlide(
                          offset: Offset(0, showCat ? 0 : 2),
                          duration: Duration(milliseconds: 750),
                          child: Column(
                            children: [
                              for (int i = 0; i < 8; i++)
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 10),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Item(
                                        iconData:
                                            Icons.access_time_filled_rounded,
                                      ),
                                      Item(
                                        iconData: Icons
                                            .account_balance_wallet_rounded,
                                      ),
                                      Item(
                                        iconData: Icons.add_business_rounded,
                                      ),
                                      Item(
                                        iconData: Icons.window,
                                      ),
                                    ],
                                  ),
                                ),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 10),
              InkWell(
                onTap: () {
                  setState(() {
                    if (hideBarContent) {
                      fillHeight = false;
                      showCat = false;
                      Timer(const Duration(milliseconds: 500), (() {
                        changeBarALign = false;
                        setState(() {});
                      }));
                      Timer(const Duration(milliseconds: 1000), (() {
                        hideBarContent = false;
                        setState(() {});
                      }));
                    } else {
                      hideBarContent = true;
                      changeBarALign = true;
                      // Timer(const Duration(milliseconds: 400), (() {
                      //   setState(() {});
                      // }));
                      Timer(const Duration(milliseconds: 250), (() {
                        fillHeight = true;
                        setState(() {});
                      }));
                      Timer(const Duration(milliseconds: 500), (() {
                        showCat = true;
                        setState(() {});
                      }));
                    }
                    setState(() {});
                  });
                },
                child: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    !fillHeight ? 'See All' : 'See less',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              )
            ]),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
