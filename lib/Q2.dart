import 'package:flutter/material.dart';

class Q2 extends StatefulWidget {
  const Q2({super.key});

  @override
  State<Q2> createState() => _Q2State();
}

class _Q2State extends State<Q2> {
  String user = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
              child: Text(
            "First Page $user",
            style: TextStyle(fontSize: 30),
          )),
          TextButton(
              onPressed: () async {
                final result = await Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SecondPage()));
                if(result!=null){
                  setState(() {
                    user=result;
                  });
                }
              },
              child: Text(
                'Jump to Second Page ',
                style: TextStyle(fontSize: 20),
              )),
        ],
      ),
    );
  }
}

class SecondPage extends StatefulWidget {
  const SecondPage({super.key});

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  TextEditingController c1 = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: c1,
              decoration: InputDecoration(
                hintText: 'Enter Name',
              ),
              style: TextStyle(fontSize: 24),
            ),
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    if (!c1.text.isEmpty) {
                      // Navigator.push(context, MaterialPageRoute(builder: (context)=>const Q2()));
                      Navigator.pop(context,c1.text);
                    }
                  });
                },
                child: Text('Submit')),
          ],
        ),
      ),
    );
  }
}
