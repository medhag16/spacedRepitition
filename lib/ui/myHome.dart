import 'package:flutter/material.dart';

class MyHome extends StatefulWidget {
  @override
  _MyHomeState createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Column(
          children: <Widget>[
            Card(
                child: Column(
              children: <Widget>[
                const ListTile(
                  leading: Icon(Icons.label_important),
                  title: Text("Linux",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  subtitle: Text("Basix linux commands",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    FlatButton(
                      child: const Text('Added 0 minutes ago',
                          style: TextStyle(fontWeight: FontWeight.normal)),
                      onPressed: () {/* ... */},
                    ),
                  ],
                )
              ],
            )),
          ],
        ),
      ),
    );
  }
}
