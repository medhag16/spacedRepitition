import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:spaced_rep_app/ui/Register.dart';
import 'package:motion_tab_bar/MotionTabBarView.dart';
import 'package:motion_tab_bar/MotionTabController.dart';
import 'package:motion_tab_bar/TabItem.dart';
import 'package:motion_tab_bar/motiontabbar.dart';
import 'package:spaced_rep_app/ui/subject_popup.dart';

MotionTabController _tabController;

class Constants {
  static const String SignOut = 'Sign out';
  static const List<String> choices = <String>[SignOut];
}

String cardname = "";

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with SingleTickerProviderStateMixin {
  //AnimationController _controller;

  @override
  void initState() {
    super.initState();
    //_controller = AnimationController(vsync: this);
    _tabController = new MotionTabController(initialIndex: 1, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    //_controller.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          bottomNavigationBar: MotionTabBar(
            labels: ["Account", "Home", "Dashboard"],
            initialSelectedTab: "Home",
            tabIconColor: Colors.green,
            tabSelectedColor: Colors.red,
            onTabItemSelected: (int value) {
              print(value);
              setState(() {
                _tabController.index = value;
              });
            },
            icons: [Icons.account_box, Icons.home, Icons.menu],
            textStyle: TextStyle(color: Colors.red),
          ),
          drawer: Drawer(
              child: ListView(
            children: <Widget>[
              DrawerHeader(
                //margin: EdgeInsets.only(top: 20),
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.fitHeight,
                        image: NetworkImage(user.photoUrl))),
                child: Text(""),
              ),
              Divider(color: Colors.black87, thickness: 3),
              ListTile(
                title: Row(
                  children: <Widget>[
                    Icon(Icons.folder),
                    Text("    All Cards"),
                  ],
                ),
                onTap: () {
                  Navigator.of(context).pop();
                },
              ),
              ListTile(
                title: Row(
                  children: <Widget>[
                    Icon(Icons.search),
                    Text("    Browse Cards"),
                  ],
                ),
                onTap: () {
                  Navigator.of(context).pop();
                },
              ),
              Divider(color: Colors.black38),
              ListTile(
                title: Row(
                  children: <Widget>[
                    Icon(Icons.account_circle),
                    Text("   My Account"),
                  ],
                ),
                onTap: () {
                  Navigator.of(context).pop();
                },
              ),
              ListTile(
                title: Row(
                  children: <Widget>[
                    Icon(Icons.help),
                    Text("   Help"),
                  ],
                ),
                onTap: () {
                  Navigator.of(context).pop();
                },
              ),
              ListTile(
                title: Row(
                  children: <Widget>[
                    Icon(Icons.settings),
                    Text("   Settings"),
                  ],
                ),
                onTap: () {
                  Navigator.of(context).pop();
                },
              ),
              ListTile(
                title: Row(
                  children: <Widget>[
                    Icon(Icons.share),
                    Text("   Share"),
                  ],
                ),
                onTap: () {
                  Navigator.of(context).pop();
                },
              ),
              Divider(color: Colors.black38),
              ListTile(
                title: Text('0.0.1'),
                onTap: () {},
              ),
            ],
          )),
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
                  onTap: () => print('Card Uploaded')),
              SpeedDialChild(
                  child: Icon(Icons.share),
                  backgroundColor: Colors.blue,
                  label: 'Share Card',
                  onTap: () => print('Share')),
            ],
          ),
          appBar: AppBar(
            backgroundColor: Colors.black12,
            title: Text(
              "Dashboard",
              style: TextStyle(fontSize: 25),
            ),
            actions: <Widget>[
              Icon(Icons.notifications),
              FlatButton(
                onPressed: () {},
                child: CircleAvatar(
                  radius: 20,
                  backgroundImage: NetworkImage(user.photoUrl),
                ),
              ),
              PopupMenuButton<String>(
                itemBuilder: (BuildContext context) {
                  return Constants.choices.map((String choice) {
                    return PopupMenuItem<String>(
                      value: choice,
                      child: FlatButton(
                          onPressed: () {
                            signOutGoogle();
                            Navigator.of(context).pushAndRemoveUntil(
                                MaterialPageRoute(builder: (context) {
                              return Register();
                            }), ModalRoute.withName('/'));
                          },
                          child: Text(choice)),
                    );
                  }).toList();
                },
              ),
            ],
          ),
          body: MyHome(),
        ));
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
              print(docs[0]);
              List<Widget> y = [];
              for (var i in docs) {
                var name = i.data()['name'];
                var sub = i.data()['subheading'];

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
                            child: const Text('Added 0 minutes ago',
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
            },
            stream: fs_instance.collection("folders").snapshots(),
          )
        ],
      ),
    );
  }
}
