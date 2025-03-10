import 'package:flutter/material.dart';
import 'package:practicalassignment5/Q1.dart';
import 'package:practicalassignment5/Q2.dart';
import 'package:practicalassignment5/Q3.dart';
import 'package:practicalassignment5/Q4.dart';
import 'package:practicalassignment5/Q5.dart';
import 'package:practicalassignment5/Q6.dart';
import 'package:practicalassignment5/Q7.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}


class _HomePageState extends State<HomePage> {

  Widget buildProgramButton(String title,VoidCallback onPressed){
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(onPressed: onPressed, child: Text(title)),
    );
  }

  Widget? SelectedProgram;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          'Practical Assignment 5 🤘',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Color.fromRGBO(45, 45, 45, 1),
      ),
      backgroundColor: Colors.white,
      body: Center(

        child: SelectedProgram != null ? SelectedProgram : Text('👈 Select Program from Side Menu',style: TextStyle(fontSize: 20),),
      ),
      drawer: Drawer(
        child: Column(
          spacing: 10,
          children: [
            SizedBox(
              width: double.infinity,
              height: 150,
              child: DrawerHeader(
                decoration: BoxDecoration(color: Colors.deepPurple),
                child: Row(
                  spacing: 20,
                  children: [
                    ClipOval(
                      child: Image.asset(
                        'assets/images/Purv.jpg',
                        width: 70,
                        height: 70,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Text(
                      'Purv Virpariya',
                      style: TextStyle(color: Colors.white, fontSize: 22),
                    ),
                  ],
                ),
              ),
            ),
            buildProgramButton('Program-1', () {
              setState(() {
                SelectedProgram=const Q1();
              });
              Navigator.pop(context);
            },),
            buildProgramButton('Program-2', () {
              setState(() {
                SelectedProgram=const Q2();
              });
              Navigator.pop(context);
            },),
            buildProgramButton('Program-3', () {
              setState(() {
                SelectedProgram=const Q3();
              });
              Navigator.pop(context);
            },),
            buildProgramButton('Program-4', () {
              setState(() {
                SelectedProgram=Q4();
              });
              Navigator.pop(context);
            },),
            buildProgramButton('Program-5', () {
              setState(() {
                SelectedProgram=Q5();
              });
              Navigator.pop(context);
            },),
            buildProgramButton('Program-6', () {
              setState(() {
                SelectedProgram=Q6();
              });
              Navigator.pop(context);
            },),
            buildProgramButton('Program-7', () {
              setState(() {
                SelectedProgram=Q7();
              });
              Navigator.pop(context);
            },),
          ],
        ),
      ),

    );

  }

}



