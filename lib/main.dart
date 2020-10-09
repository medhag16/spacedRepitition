import 'package:flutter/material.dart';
import 'package:spaced_rep_app/ui/myHome.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          floatingActionButton: FloatingActionButton(
            onPressed: null,
            child: Icon(Icons.add),
            backgroundColor: Colors.black54,
          ),
          appBar: AppBar(
            backgroundColor: Colors.black12,
            leading: Icon(Icons.menu),
            title: Text(
              "Dahboard",
              style: TextStyle(fontSize: 25),
            ),
            actions: <Widget>[
              Icon(Icons.notifications),
              SizedBox(
                width: 5,
              ),
              Icon(Icons.more_vert),
              SizedBox(
                width: 10,
              ),
            ],
          ),
          body: MyHome(),
        ));
  }
}
