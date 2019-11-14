import 'package:flutter/material.dart';
import 'package:flutter_progress_button/flutter_progress_button.dart';

class InitialQuestionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange[600],
      body: Container(
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.only(top: 200),
        child: Column(
          children: <Widget>[
            ProgressButton(
              color: Color.fromRGBO(251, 255, 255, 0.9),
              progressWidget: const CircularProgressIndicator(),
              width: 300,
              height: 60,
              onPressed: () async {
                int score = await Future.delayed(
                    const Duration(milliseconds: 3000), () => 42);
                // After [onPressed], it will trigger animation running backwards, from end to beginning
                return () {
                  // Optional returns is returning a function that can be called
                  // after the animation is stopped at the beginning.
                  // A best practice would be to do time-consuming task in [onPressed],
                  // and do page navigation in the returned function.
                  // So that user won't missed out the reverse animation.
                };
              },
              defaultWidget: new Text(
                "Sou cliente",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.orangeAccent[700],
                ),
              ),
            ),
            Ink(),
            Container(
              padding: EdgeInsets.only(top: 50),
              child: ProgressButton(
                progressWidget: const CircularProgressIndicator(),
                color: Color.fromRGBO(251, 255, 255, 0.9),
                width: 300,
                height: 60,
                onPressed: () async {
                  int score = await Future.delayed(
                      const Duration(milliseconds: 3000), () => 42);
                  // After [onPressed], it will trigger animation running backwards, from end to beginning
                  return () {};
                },
                defaultWidget: new Text(
                  "Sou Motorista",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.orangeAccent[700],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
