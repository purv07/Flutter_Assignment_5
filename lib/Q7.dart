import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

// Create a simple to-do application that allows user to add, remove, and view their
// task.

class Q7 extends StatefulWidget {
  const Q7({super.key});

  @override
  State<Q7> createState() => _Q7State();
}

class _Q7State extends State<Q7> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getCurrentDate();
  }
  void addTask(String value) {
    int newKey = toDo.isEmpty ? 1 : toDo.keys.last + 1;
    toDo[newKey] = value;
  }
  void updateTask(int key,String value){
    toDo[key]=value;
  }

  final Map<int, String> toDo = {
    1: "Milk",
    2: "Laptop",
    3: "TV",
  };

  String formatDate = "";
  void _getCurrentDate() {
    DateTime now = DateTime.now();
    formatDate = DateFormat('EEEE,d MMM').format(now);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController c1 = new TextEditingController();
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: Column(
                          children: [
                            Text(
                              "Today's Task",
                              style: GoogleFonts.lato(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w800,
                                  fontSize: 30),
                            ),
                            Text(
                              "$formatDate",
                              style: GoogleFonts.lato(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 15),
                            ),
                          ],
                        ),
                      ),
                      ElevatedButton.icon(
                        label: Text(
                          'New Task',
                          style: GoogleFonts.lato(
                              fontWeight: FontWeight.w600,
                              fontSize: 15,
                              color: Colors.white),
                        ),
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  actions: [
                                    TextButton(
                                        onPressed: () {
                                          setState(() {
                                            addTask(c1.text.toString());
                                          });
                                          Navigator.pop(context);
                                        },
                                        child: Text('Submit'))
                                  ],
                                  backgroundColor: Colors.white,
                                  title: Text('New Task '),
                                  content: TextField(
                                    controller: c1,
                                    decoration: InputDecoration(
                                      labelText: 'Task',
                                    ),
                                  ),
                                );
                              });
                        },
                        icon: Icon(
                          Icons.add,
                          color: Colors.white,
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blueAccent,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          elevation: 3,
                        ),
                      ),
                    ],
                  ),
                ),
                Divider(),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: Column(
                    children: toDo.entries.map((todo) {
                      return Container(
                        width: double.infinity,
                        height: 80,
                        child: Card(
                          color: Colors.white,
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    textAlign: TextAlign.start,
                                    todo.value,
                                    style: GoogleFonts.lato(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 18),
                                  ),
                                  Row(
                                    children: [
                                      IconButton(
                                          onPressed: () {
                                            setState(() {
                                            toDo.remove(todo.key);
                                            });
                                          },
                                          icon: Icon(
                                            Icons.delete,
                                            color: Colors.redAccent,
                                            size: 20,
                                          )),
                                      IconButton(
                                          onPressed: () {
                                            setState(() {
                                              c1.text=todo.value;
                                              showDialog(
                                                  context: context,
                                                  builder: (context) {
                                                    return AlertDialog(
                                                      actions: [
                                                        TextButton(
                                                            onPressed: () {
                                                              setState(() {
                                                                updateTask(todo.key,c1.text.toString());
                                                              });
                                                              Navigator.pop(context);
                                                            },
                                                            child: Text('Submit'))
                                                      ],
                                                      backgroundColor: Colors.white,
                                                      title: Text('New Task '),
                                                      content: TextField(
                                                        controller: c1,
                                                        decoration: InputDecoration(
                                                          labelText: 'Task',
                                                        ),
                                                      ),
                                                    );
                                                  });
                                            });
                                          },
                                          icon: Icon(
                                            Icons.edit,
                                            color: Colors.greenAccent,
                                            size: 20,
                                          )),
                                    ],
                                  ),

                                  // ElevatedButton.icon(
                                  //   onPressed: () {},
                                  //   label: Text(''),
                                  //   icon: Icon(Icons.delete),
                                  // ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
