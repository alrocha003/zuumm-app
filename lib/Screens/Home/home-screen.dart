import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:zuumm_app/Models/Notification.dart' as notify;
import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:zuumm_app/Widget/bottom_navy_bar.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
  final List<notify.Notification> notifications = [];

  @override
  void initState() {
    super.initState();

    // _firebaseMessaging.configure(
    //   onMessage: (Map<String, dynamic> notification) async {
    //     setState(() {
    //       notifications.add(
    //         notify.Notification(
    //           title: notification["notification"]["title"],
    //           body: notification["notification"]["body"],
    //           color: Colors.red,
    //         ),
    //       );
    //     });
    //   },
    //   onLaunch: (Map<String, dynamic> notification) async {
    //     setState(() {
    //       notifications.add(
    //         notify.Notification(
    //           title: notification["notification"]["title"],
    //           body: notification["notification"]["body"],
    //           color: Colors.green,
    //         ),
    //       );
    //     });
    //   },
    //   onResume: (Map<String, dynamic> notification) async {
    //     setState(() {
    //       notifications.add(
    //         notify.Notification(
    //           title: notification["notification"]["title"],
    //           body: notification["notification"]["body"],
    //           color: Colors.blue,
    //         ),
    //       );
    //     });
    //   },
    // );
    // _firebaseMessaging.requestNotificationPermissions();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange[700],
      // appBar: new AppBar(
      //   title: new Text("Home - Zuumm App"),
      //   automaticallyImplyLeading: true,
      //   leading: IconButton(
      //     icon: Icon(Icons.arrow_back),
      //     onPressed: () => Navigator.pushNamed(context, '/Login'),
      //   ),
      //   actions: <Widget>[
      //     Center(
      //       child: Icon(
      //         Icons.person,
      //         color: Colors.black,
      //         size: 35.0,
      //       ),
      //     ),
      //   ],
      // ),
      body: new Container(
        color: Colors.orange[700],
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.fromLTRB(10, 100, 0, 0),
              child: Text(
                "O que você deseja enviar?",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 10, top: 2),
              width: MediaQuery.of(context).size.width / 1.1,
              height: MediaQuery.of(context).size.height / 18,
              child: new TextFormField(
                decoration: new InputDecoration(
                  labelText: "Insira uma descrição de produto",
                  fillColor: Colors.white,
                  hoverColor: Colors.white,
                  focusColor: Colors.white,
                  border: new OutlineInputBorder(
                    borderRadius: new BorderRadius.circular(25.0),
                    borderSide: new BorderSide(color: Colors.white),
                  ),
                  //fillColor: Colors.green
                ),
                validator: (val) {
                  if (val.length == 0) {
                    return "Insira uma descrição de objeto";
                  } else {
                    return null;
                  }
                },
                keyboardType: TextInputType.text,
                style: new TextStyle(
                  fontFamily: "Poppins",
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(10, 100, 0, 0),
              child: Text(
                "Veículo de qual porte?",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: new Container(
        height: MediaQuery.of(context).size.height / 13,
        child: CurvedNavigationBar(
          initialIndex: 1,
          backgroundColor: Colors.orange[700],
          items: <Widget>[
            Icon(Icons.access_time, size: 30),
            Icon(Icons.home, size: 30),
            Icon(Icons.person, size: 30),
          ],
          onTap: (index) {
            //Handle button tap
          },
        ),
      ),
    );
  }
}
