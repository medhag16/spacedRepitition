import 'package:flutter/material.dart';

final _formKey = GlobalKey<FormState>();

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
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: "Subheading",
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: RaisedButton(
                      child: Text("Submit"),
                      onPressed: () {
                        if (_formKey.currentState.validate()) {
                          _formKey.currentState.save();
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
