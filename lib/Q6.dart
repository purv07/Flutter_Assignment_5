import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Q6 extends StatefulWidget {
  const Q6({super.key});

  @override
  State<Q6> createState() => _Q6State();
}

class _Q6State extends State<Q6> {
  final GoogleSignIn _googleSignIn = GoogleSignIn(); // Corrected instantiation
  GoogleSignInAccount? _user; // Store signed-in user details

  void _googleSignInMethod() async {
    try {
      final GoogleSignInAccount? user = await _googleSignIn.signIn();
      if (user != null) {
        setState(() {
          _user = user;
        });
        print("Signed in: ${user.displayName}");
      } else {
        print("Sign-in aborted by user.");
      }
    } catch (e) {
      print("Google Sign-In Error: $e");
    }
  }

  void _googleSignOut() async {
    await _googleSignIn.signOut();
    setState(() {
      _user = null;
    });
    print("User signed out.");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (_user != null)
              Column(
                children: [
                  CircleAvatar(
                    backgroundImage: NetworkImage(_user!.photoUrl ?? ""),
                    radius: 40,
                  ),
                  SizedBox(height: 10),
                  Text("Welcome, ${_user!.displayName}"),
                  SizedBox(height: 10),
                  Text("${_user!.email}"),
                  SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: _googleSignOut,
                    child: Text('Sign Out'),
                  ),
                ],
              )
            else
              ElevatedButton(
                onPressed: _googleSignInMethod,
                child: Text('Google Sign In'),
              ),
          ],
        ),
      ),
    );
  }
}
