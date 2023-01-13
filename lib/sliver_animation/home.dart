import 'package:flutter/material.dart';
import 'curved.dart';

class Sliver extends StatefulWidget {
  const Sliver({super.key});

  @override
  State<Sliver> createState() => _SliverState();
}

class _SliverState extends State<Sliver> {
  final ScrollController _controller = ScrollController();

  double _offset = 0.0;
  double data = 0.0;

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      setState(() {
        _offset = _controller.offset;
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
          child: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            CustomScrollviewAppBar(offset: _offset),
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.zero,
                controller: _controller,
                itemCount: 4,
                itemBuilder: ((context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Container(
                      height: 300,
                      color: Colors.blue,
                    ),
                  );
                }),
              ),
            ),
          ],
        ),
      )),
    ));
  }
}
