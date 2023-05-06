import 'package:flutter/material.dart';


import 'components/body.dart';
import 'components/forgot_password_form.dart';

class ForgotPasswordScreen extends StatelessWidget {
  static String routeName = "/forgot_password";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text("Forgot Password"),
      ),
      body: ResetPasswordScreen(),
    );
  }
}
