import 'dart:developer';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class Q4 extends StatefulWidget {
  const Q4({super.key});

  @override
  State<Q4> createState() => _Q4State();
}

// Add this Inside AndroidManifest.xml
// <uses-permission android:name="android.permission.ACCESS_FINE_LOCATION" />
// <uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION" />

class _Q4State extends State<Q4> {
  bool isLoading = false;
  double? lati = 0.0;
  double? long = 0.0;

  getCurrentLocation() async {
    setState(() {
      isLoading = true;
    });
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied ||
        permission == LocationPermission.deniedForever) {
      log("Location Denied");
      LocationPermission ask = await Geolocator.requestPermission();
    } else {
      Position currentPos = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low);
      setState(() {
        lati = currentPos.latitude;
        long = currentPos.longitude;
      });
      log("lat = ${currentPos.latitude} ");
      log("long = ${currentPos.longitude} ");
    }
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child:isLoading ? CircularProgressIndicator(): Column(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 20,
          children: [
            Text('Current Location :- $lati - $long'),
            ElevatedButton(
                onPressed: () {
                  getCurrentLocation();
                },
                child: Text('Get Location')),

          ],
        ),
      ),
    );
  }
}
