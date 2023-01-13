import 'dart:math';

import 'package:flutter/material.dart';
import 'custom_icon.dart';

class CustomScrollviewAppBar extends StatefulWidget {
  const CustomScrollviewAppBar({
    Key? key,
    required this.offset,
  }) : super(key: key);

  final double offset;

  @override
  State<CustomScrollviewAppBar> createState() => _CustomScrollviewAppBarState();
}

class _CustomScrollviewAppBarState extends State<CustomScrollviewAppBar> {
  double topChange = 100;
  Widget change(double width) {
    return AnimatedPositioned(
      duration: const Duration(milliseconds: 250),
      top: 12,
      left: 25,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        height: 50,
        width: widget.offset > 30 ? 20 : width,
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 250),
          child: widget.offset > 30
              ? const Icon(
                  Icons.search,
                  color: Colors.white,
                )
              : TextField(
                  decoration: InputDecoration(
                    hintStyle: const TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w300),
                    hintText: 'Search',
                    filled: true,
                    fillColor: Colors.black.withOpacity(.7),
                    border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(10)),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(10)),
                    prefixIcon: const Icon(
                      Icons.search,
                      color: Colors.white,
                    ),
                  ),
                ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    const double maxExtent = 123;
    const double minExtent = 80;
    final double shrinkOffset = widget.offset;
    final expendPercentage =
        1.0 - min(1, shrinkOffset / (maxExtent - minExtent));

    return AnimatedContainer(
      duration: const Duration(milliseconds: 100),
      height: minExtent + (maxExtent - minExtent) * expendPercentage,
      width: width,
      color: Colors.red,
      child: Stack(
        children: [
          AnimatedContainer(
              duration: const Duration(milliseconds: 250),
              child: change(width * .8)
              // : const AnimatedPositioned(
              //     top: 25,
              //     left: 15,
              //     duration: Duration(seconds: 2),
              //     child: Icon(
              //       Icons.search,
              //       color: Colors.white,
              //     )),
              ),
          Positioned(
            top: 22,
            right: 10,
            child: Container(
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(50)),
                child: const Icon(
                  Icons.person,
                  size: 20,
                  color: Colors.grey,
                )),
          ),
          AnimatedPositioned(
            duration: const Duration(milliseconds: 250),
            top: widget.offset > 30 ? 25 : 70,
            left: widget.offset > 30 ? 60 : 0,
            right: widget.offset > 30 ? 50 : 0,
            child: AnimatedContainer(
              duration: const Duration(seconds: 1),
              width: widget.offset > 30 ? width * .80 : width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CustomIcon(
                      offset: widget.offset, iconData: Icons.logout_outlined),
                  CustomIcon(
                      offset: widget.offset, iconData: Icons.attach_money),
                  CustomIcon(offset: widget.offset, iconData: Icons.qr_code),
                  CustomIcon(
                      offset: widget.offset,
                      iconData: Icons.document_scanner_outlined),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
