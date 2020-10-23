import 'package:flutter/material.dart';
import 'package:motion_tab_bar/MotionTabBarView.dart';
import 'package:motion_tab_bar/MotionTabController.dart';
import 'package:motion_tab_bar/motiontabbar.dart';
import 'package:spaced_rep_app/ui/homeScreen.dart';
import 'package:spaced_rep_app/ui/myHome.bak';
import 'Register.dart';
import 'homeScreen.dart';
import 'chat.dart';

class MyApp1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  MotionTabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = MotionTabController(initialIndex: 1, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Drawer(
            child: ListView(
          children: <Widget>[
            DrawerHeader(
              margin: EdgeInsets.only(top: 20),
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
        bottomNavigationBar: MotionTabBar(
          labels: ["Progress", "Home", "Chat"],
          initialSelectedTab: "Home",
          tabIconColor: Colors.green,
          tabSelectedColor: Colors.red,
          onTabItemSelected: (int value) {
            print(value);
            setState(() {
              _tabController.index = value;
            });
          },
          icons: [Icons.dashboard, Icons.home, Icons.chat],
          textStyle: TextStyle(color: Colors.red),
        ),
        body: MotionTabBarView(
          controller: _tabController,
          children: <Widget>[
            Container(
              child: Text("Dashboard"),
            ),
            Container(
              child: Center(
                child: HomeScr(),
              ),
            ),
            Container(
              child: Center(
                child: MyChat(),
              ),
            ),
          ],
        ));
  }
}
