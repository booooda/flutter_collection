import 'package:flutter/material.dart';
import 'package:flutter_collection/home.dart';
import 'package:flutter_collection/smart%20switch/provider.dart';
import 'package:provider/provider.dart';
import 'duck/duck.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => HomeModel()),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          fontFamily: 'Ageo',
        ),
        home: const Home());
  }
}
