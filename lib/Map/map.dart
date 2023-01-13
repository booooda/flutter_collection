// import 'package:flutter/material.dart';
// import 'package:geocoding/geocoding.dart';
// import 'package:geolocator/geolocator.dart';

// class Map extends StatefulWidget {
//   const Map({super.key});

//   @override
//   State<Map> createState() => _MapState();
// }

// class _MapState extends State<Map> {
//   var lati = "";
//   var long = "";
//   var alti = "";
//   var speed = "";
//   var address = "";

//   Future<void> update() async {
//     Position pos = await _determinePosition();
//     List pm = await placemarkFromCoordinates(pos.latitude, pos.longitude);
//     setState(() {
//       lati = pos.latitude.toString();
//       long = pos.longitude.toString();
//       alti = pos.altitude.toString();
//       speed = pos.speed.toString();
//       address = pm[0].toString();
//     });
//   }

//   Future<Position> _determinePosition() async {
//     bool serviceEnabled;
//     LocationPermission permission;
//     serviceEnabled = await Geolocator.isLocationServiceEnabled();
//     if (!serviceEnabled) {
//       return Future.error("location services are disabled");
//     }
//     permission = await Geolocator.checkPermission();
//     if (permission == LocationPermission.denied) {
//       permission = await Geolocator.requestPermission();
//       if (permission == LocationPermission.denied) {
//         return Future.error("location permission is denied");
//       }
//     }
//     if (permission == LocationPermission.deniedForever) {
//       return Future.error("location permission is denied for ever");
//     }
//     return await Geolocator.getCurrentPosition();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(child: Scaffold(body: Container()));
//   }
// }
