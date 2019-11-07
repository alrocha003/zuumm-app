import 'package:flutter/material.dart';
import 'package:zuumm_app/Models/Notification.dart' as notify;
import 'package:firebase_messaging/firebase_messaging.dart';

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
  
    _firebaseMessaging.configure(
      onMessage: (Map<String, dynamic> notification) async {
        setState(() {
          notifications.add(
            notify.Notification(
              title: notification["notification"]["title"],
              body: notification["notification"]["body"],
              color: Colors.red,
            ),
          );
        });
      },
      onLaunch: (Map<String, dynamic> notification) async {
        setState(() {
          notifications.add(
            notify.Notification(
              title: notification["notification"]["title"],
              body: notification["notification"]["body"],
              color: Colors.green,
            ),
          );
        });
      },
      onResume: (Map<String, dynamic> notification) async {
        setState(() {
          notifications.add(
            notify.Notification(
              title: notification["notification"]["title"],
              body: notification["notification"]["body"],
              color: Colors.blue,
            ),
          );
        });
      },
    );
    _firebaseMessaging.requestNotificationPermissions();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Home - Zuumm App"),
        automaticallyImplyLeading: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pushNamed(context, '/Login'),
        ),
        actions: <Widget>[
          Center(
            child: Icon(
              Icons.person,
              color: Colors.black,
              size: 35.0,
            ),
          ),
        ],
      ),
      body: new Container(
        child: Column(
          children: <Widget>[],
        ),
      ),
    );
  }
}
