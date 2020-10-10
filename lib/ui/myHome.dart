import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:spaced_rep_app/ui/Register.dart';

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
              "Dashboard",
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
              FlatButton(
                onPressed: () {
                  signOutGoogle();
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return Register();
                    },
                  ));
                },
                child: CircleAvatar(
                  radius: 20,
                  // minRadius: 10,
                  backgroundImage: NetworkImage(user.photoUrl),
                ),
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
                  trailing: Icon(Icons.bookmark),
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
