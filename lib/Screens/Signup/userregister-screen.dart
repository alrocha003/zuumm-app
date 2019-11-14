import 'package:flutter/material.dart';
import 'package:zuumm_app/Widget/Forms/userform.dart';

class UserRegisterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 8.0),
          child: UserRegisterForm(),
        ),
      ),
    );
  }
}
