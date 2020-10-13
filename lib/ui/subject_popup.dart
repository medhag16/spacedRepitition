import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:firebase_core/firebase_core.dart';

final fs_instance = FirebaseFirestore.instance;
final _formKey = GlobalKey<FormState>();
var folder_name, folder_subheading;
void doc_save() async {
  try {
    fs_instance
        .collection("folders")
        .add({'name': folder_name, 'subheading': folder_subheading});
  } catch (e) {
    print(e);
  }
}

Future subPop(context) {
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        elevation: 20,
        content: Stack(
          overflow: Overflow.visible,
          children: <Widget>[
            Positioned(
              //right: -50.0,
              top: -50.0,
              child: InkResponse(
                // onTap: () {
                //   Navigator.of(context).pop();
                // },
                child: CircleAvatar(
                  radius: 30,
                  child: Icon(Icons.create_new_folder),
                  //backgroundColor: Colors.red,
                ),
              ),
            ),
            Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: "Name",
                      ),
                      onChanged: (value) {
                        folder_name = value;
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: "Subheading",
                      ),
                      onChanged: (value) {
                        folder_subheading = value;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: RaisedButton(
                      child: Text("Submit"),
                      onPressed: () {
                        if (_formKey.currentState.validate()) {
                          _formKey.currentState.save();
                          doc_save();
                          Navigator.of(context).pop();
                        }
                      },
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      );
    },
  );
}
