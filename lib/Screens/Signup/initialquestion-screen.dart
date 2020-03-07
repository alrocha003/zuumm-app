import 'package:flutter/material.dart';
import 'package:flutter_progress_button/flutter_progress_button.dart';
import 'package:zuumm_app/Screens/Signup/driverregister-screen.dart';
import 'package:zuumm_app/Screens/Signup/userregister-screen.dart';

class InitialQuestionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white38,
      body: Container(
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.only(top: 300),
        child: Column(
          children: <Widget>[
            ProgressButton(
              borderRadius: 10,
              color: Color.fromRGBO(240, 240, 240, 0.9),
              progressWidget: const CircularProgressIndicator(),
              width: 300,
              height: 60,
              onPressed: () async {
                await Future.delayed(
                    const Duration(milliseconds: 3000), () => 42);
                return () => navigateToUserFormScreen(context);
              },
              defaultWidget: new Text(
                "Sou cliente",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.orangeAccent[700],
                ),
              ),
            ),
            SizedBox(
              height: 100,
            ),
            ProgressButton(
              borderRadius: 10.0,
              progressWidget: const CircularProgressIndicator(),
              color: Color.fromRGBO(240, 240, 240, 0.9),
              width: 300,
              height: 60,
              onPressed: () async {
                int score = await Future.delayed(
                    const Duration(milliseconds: 3000), () => 42);
                // After [onPressed], it will trigger animation running backwards, from end to beginning
                return () => navigateToDriverFormScreen(context);
              },
              defaultWidget: new Text(
                "Sou Motorista",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.orangeAccent[700],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void navigateToUserFormScreen(BuildContext context) {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => UserRegisterScreen()));
  }

  void navigateToDriverFormScreen(BuildContext context) {
    Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (context) => DriverRegisterScreen()));
  }
}
