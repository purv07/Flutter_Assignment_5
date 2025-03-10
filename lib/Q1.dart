import 'package:flutter/material.dart';

class Q1 extends StatefulWidget {
  const Q1({super.key});

  @override
  State<Q1> createState() => _Q1State();
}

class _Q1State extends State<Q1> {
  TextEditingController c1 = new TextEditingController();
  TextEditingController c2 = new TextEditingController();
  String UID="24MSIT188";
  String Pass="test";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 30,
        children: [
          TextField(
            controller: c1,
            decoration: InputDecoration(
              hintText: 'Enter UserID',
            ),
            style: TextStyle(fontSize: 24),
          ),
          TextField(
            obscureText: true,
            controller: c2,
            decoration: InputDecoration(
              hintText: 'Enter Password',
            ),
            style: TextStyle(fontSize: 24),
          ),
          ElevatedButton(onPressed: () {
            setState(() {
              if(UID==c1.text.toString() && Pass==c2.text.toString()){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> const GreetPage()));
              }else{
                showDialog(context: context, builder: (context){
                  return AlertDialog(
                    title: Text('Login Failed',style: TextStyle(color: Colors.white),),
                    content: Text('UserId & Password is Wrong!!!',style: TextStyle(color: Colors.white,fontSize: 20),),
                    actions: [
                      TextButton(onPressed: (){
                        setState(() {
                          Navigator.pop(context);
                        });
                      }, child: Text('Ok')),
                    ],
                    backgroundColor: Color.fromRGBO(45, 45, 45, 1),
                  );
                });
              }
            });
          }, child: Text('Login Now',style: TextStyle(fontSize: 17),)),
          Text('$UID / $Pass',style: TextStyle(fontSize: 20),)
        ],
      )),
    );
  }
}

class GreetPage extends StatelessWidget {
  const GreetPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome'),
      ),
      body: Center(
        child: Text('Welcome to Flutter App',style: TextStyle(fontSize: 30),),
      ),
    );
  }
}

