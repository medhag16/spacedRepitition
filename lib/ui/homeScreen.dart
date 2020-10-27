import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
//import 'package:firebase_messaging/firebase_messaging.dart';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:spaced_rep_app/ui/Register.dart';
import 'package:motion_tab_bar/MotionTabBarView.dart';
import 'package:motion_tab_bar/MotionTabController.dart';
import 'package:motion_tab_bar/TabItem.dart';
import 'package:motion_tab_bar/motiontabbar.dart';
import 'package:spaced_rep_app/ui/Seach.dart';
import 'package:spaced_rep_app/ui/subject_popup.dart';
import 'package:image_picker/image_picker.dart';
import 'Register.dart';

class HomeScr extends StatefulWidget {
  @override
  _HomeScrState createState() => _HomeScrState();
}

class _HomeScrState extends State<HomeScr> {
  File filepath;
  final picker = ImagePicker();

  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {
        filepath = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: SpeedDial(
        marginRight: 20,
        animatedIcon: AnimatedIcons.menu_close,
        animatedIconTheme: IconThemeData(size: 30.0),
        closeManually: false,
        marginBottom: 20,
        overlayColor: Colors.black,
        overlayOpacity: 0.7,
        elevation: 15,
        children: [
          SpeedDialChild(
              child: Icon(Icons.book),
              label: 'Add Subject',
              onTap: () => subPop(context)),
          SpeedDialChild(
              child: Icon(Icons.file_upload),
              label: 'Upload Card',
              onTap: getImage),
          SpeedDialChild(
              child: Icon(Icons.share),
              backgroundColor: Colors.blue,
              label: 'Share Card',
              onTap: () => print('Share')),
          SpeedDialChild(
            child: Icon(Icons.search),
            label: 'Search Card',
            /*onTap: () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => MyCardSearch())),*/
          )
        ],
      ),
      body: MyHome(),
    );
  }
}

class MyHome extends StatefulWidget {
  @override
  _MyHomeState createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  @override
  // ignore: override_on_non_overriding_member
  var name = user.displayName;
  Widget build(BuildContext context) {
    return Center(
      child: ListView(
        children: <Widget>[
          SizedBox(height: 5),
          Card(
            elevation: 15,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(300)),
            child: GestureDetector(
              onTap: () {
                print("clicked ..");
              },
              child: Container(
                alignment: Alignment.center,
                child: Text(
                  "Welcome : $name",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                height: 75,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  gradient: LinearGradient(
                    colors: [
                      Color(0xFFe9B5B8),
                      Color(0xFF4481E8),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 5),
          StreamBuilder<QuerySnapshot>(
            builder: (context, snapshot) {
              var docs = snapshot.data.docs;
              if (docs.length == 0) {
                return Center(
                  child: Text(
                    "No Cards yet",
                    style: TextStyle(fontSize: 20.0, color: Colors.grey),
                  ),
                );
              } else {
                print(docs[0]);
                List<Widget> y = [];
                for (var i in docs) {
                  var name = i.data()['name'];
                  var sub = i.data()['subheading'];
                  var time = i.data()['timestamp'];
                  var t = DateTime.now().millisecondsSinceEpoch -
                      time.toDate().millisecondsSinceEpoch;
                  //print(t);
                  t = t / 60000;
                  t = t.toInt();
                  print(t);
                  var wid = Card(
                    child: Column(
                      children: <Widget>[
                        ListTile(
                          leading: Icon(Icons.label_important),
                          trailing: Icon(Icons.bookmark),
                          title: Text("$name",
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          subtitle: Text("$sub",
                              style: TextStyle(fontWeight: FontWeight.bold)),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            FlatButton(
                              child: Text('Added $t minutes ago',
                                  style:
                                      TextStyle(fontWeight: FontWeight.normal)),
                              onPressed: () {/* ... */},
                            ),
                          ],
                        )
                      ],
                    ),
                  );
                  y.add(wid);
                }
                return Container(
                  child: Column(
                    children: y,
                  ),
                );
              }
            },
            stream: fs_instance
                .collection("users")
                .doc(user.email)
                .collection("fol")
                .orderBy("timestamp", descending: true)
                .snapshots(),
          )
        ],
      ),
    );
  }
}
