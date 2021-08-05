import 'package:flutter/material.dart';
import 'services/auth_services.dart';

TextEditingController emailController = TextEditingController(text : "");
TextEditingController passwordController = TextEditingController(text : "");


class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login Page"),),
      body: Center(
        child: Column(
          children: <Widget> [
            Container(
              width: 300,
              height:100,
              child: TextField(
                controller: emailController,
              ),
            ),
            Container(
              width: 300,
              height:100,
              child: TextField(
                controller: passwordController,
              ),
            ),
          RaisedButton(
          child: Text('Masuk'),
          onPressed: () async {
            await AuthServices.signIn(emailController.text, passwordController.text);
          },
        ),
       ],
      ),
      ),
    );
  }
}