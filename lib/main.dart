import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
//import 'package:toast/toast.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
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
          drawer: Drawer(
              child: ListView(
            children: <Widget>[
              DrawerHeader(
                margin: EdgeInsets.only(top: 20),
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.contain,
                        image: NetworkImage(
                            'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcTaH7it4ppZCrkP7zNdd8l_bae_rRRYXXM3IA&usqp=CAU'))),
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
                  //backgroundColor: Colors.amber,
                  label: 'Add Subject',
                  onTap: () => print('Subject Added')),
              SpeedDialChild(
                  child: Icon(Icons.file_upload),
                  //backgroundColor: Colors.amber,
                  label: 'Upload Card',
                  onTap: () => print('Card Added')),
              SpeedDialChild(
                  child: Icon(Icons.share),
                  backgroundColor: Colors.blue,
                  label: 'Share Card',
                  onTap: () => print('Added')),
            ],
          ),
          appBar: AppBar(
            backgroundColor: Colors.black12,
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
