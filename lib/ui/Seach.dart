//import 'dart:html';

/*import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:spaced_rep_app/ui/Register.dart';
import 'package:spaced_rep_app/ui/navigation.dart';
//import 'package:spaced_rep_app/ui/Register.dart';

class MyCardSearch extends StatefulWidget {
  @override
  _MyCardSearchState createState() => _MyCardSearchState();
}

class _MyCardSearchState extends State<MyCardSearch> {
  @override
  String searchCard;
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          margin: EdgeInsets.all(100),
          child: Column(
            children: <Widget>[
              TextField(
                onChanged: (value) {
                  searchCard = value;
                  //print(searchCard);
                },
              ),
              FlatButton(
                child: Text("Submit"),
                onPressed: () async {
                  //print(searchCard);
                  QuerySnapshot querysnapshot = await searchByName(searchCard);
                  print(querysnapshot.docs);
                },
              ),
              FlatButton(
                child: Text("Back"),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MyHomePage()),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

searchByName(String searchCard) async {
  /*return fs_instance
        .collection("users")
        .where('userName', isEqualTo: searchField)
        .getDocuments();*/
  /*return await fs_instance
      .collection("users")
      .doc(user.uid)
      .collection("fol")
      .where('name', isEqualTo: searchCard)
      .get();*/

  List<DocumentSnapshot> documentList;
  documentList = (await fs_instance
          .collection("users")
          .doc(user.uid)
          .collection("fol")
          .where("name", isEqualTo: searchCard)
          .get())
      .docs;
}*/
