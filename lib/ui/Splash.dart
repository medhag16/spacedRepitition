import 'package:flutter/material.dart';
import 'package:spaced_rep_app/ui/Register.dart';
import 'package:splashscreen/splashscreen.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 6,
      navigateAfterSeconds: Register(),
      title: Text(
        "SPACED REPETITION",
        style: new TextStyle(
          color: Colors.orange,
          fontWeight: FontWeight.bold,
          fontSize: 20.0,
        ),
      ),
      image: Image.network(
          "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcTaH7it4ppZCrkP7zNdd8l_bae_rRRYXXM3IA&usqp=CAU"),
      backgroundColor: Colors.white,
      styleTextUnderTheLoader: new TextStyle(),
      photoSize: 100.0,
      onClick: () => print("Flutter Egypt"),
      loaderColor: Colors.red,
    );
  }
}
