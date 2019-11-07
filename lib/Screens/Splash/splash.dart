import 'package:flutter/material.dart';
import 'package:zuumm_app/Screens/Login/initial-screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    /// Initialize data, then navigator to Home screen.
    initData().then((value) {
      navigateToLoginScreen();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: new BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomRight,
                  colors: [
                Colors.orange[700],
                // Colors.orangeAccent,
                Colors.orange,
                Colors.white70
              ])),
          child: new Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Text(
                "Zuumm App",
                style: new TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 60,
                    fontFamily: 'roboto',
                    color: Colors.white70),
              ),
              new Text(
                "Seu app de entregas =)",
                style: new TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              )
            ],
          ),
        ));
  }

  Future initData() async {
    await Future.delayed(Duration(seconds: 4));
  }

  void navigateToLoginScreen() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => InitialScreen()));
  }
}
