import 'dart:developer';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:url_launcher/url_launcher.dart';

class Q5 extends StatefulWidget {
  const Q5({super.key});

  @override
  State<Q5> createState() => _Q5State();
}

//   url_launcher: ^6.3.1
// Add this Inside AndroidManifest.xml
// <uses-permission android:name="android.permission.ACCESS_FINE_LOCATION" />
// <uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION" />

class _Q5State extends State<Q5> {
  bool isLoading = false;
  double? lati = 0.0;
  double? long = 0.0;

  getCurrentLocation() async {
    setState(() {
      isLoading=true;
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
      isLoading=false;
    });
  }

  getLocation() async {
    setState(() {
      isLoading = true;
    });
     await getCurrentLocation();
    // Construct the Google Maps URL using dynamic coordinates
    final Uri googleUrl = Uri.parse('https://www.google.com/maps/search/?api=1&query=$lati,$long');

    // Check if the URL can be launched
    if (await canLaunchUrl(googleUrl)) {
      await launchUrl(googleUrl); // Removed forceWebView for default behavior
    } else {
      setState(() {
        isLoading = false;
      });
      throw 'Could not launch $googleUrl';
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
            ElevatedButton(
                onPressed: () {
                  getLocation();
                },
                child: Text('Google Map')),
          ],
        ),
      ),
    );
  }
}
