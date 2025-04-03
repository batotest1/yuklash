import 'package:flutter/material.dart';

void main() => runApp(
      MaterialApp(
        home: Home(),
        debugShowCheckedModeBanner: false,
      ),
    );

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String top = "";
  String remov = "";
  List nomlist = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: nomlist.length,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: 50,
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
            ),
            child: Row(
              children: [
                Text(
                  nomlist[index],
                ),
                IconButton(
                    onPressed: () {
                      setState(() {
                        nomlist.removeAt(index);
                      });
                    },
                    icon: Icon(Icons.delete)),
                IconButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) => SimpleDialog(
                          children: [
                            TextField(
                              onChanged: (value) {
                                setState(() {
                                  remov = value;
                                });
                              },
                            ),
                            Row(
                              children: [
                                TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: Text('No')),
                                TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                      setState(() {
                                        nomlist[index] = remov;
                                      });
                                    },
                                    child: Text('Yes'))
                              ],
                            )
                          ],
                        ),
                      );
                    },
                    icon: Icon(Icons.remove))
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) => SimpleDialog(
              children: [
                TextField(
                  onChanged: (value) {
                    setState(() {
                      top = value;
                    });
                  },
                ),
                Row(
                  children: [
                    TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text("Cencel")),
                    TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                          setState(() {
                            nomlist.add(top);
                          });
                        },
                        child: Text("Ok")),
                  ],
                )
              ],
            ),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
