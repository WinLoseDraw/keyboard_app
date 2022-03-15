// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_manager/firebase_auth.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Sign In",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24.0,
          ),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.all(20.0),
              child: ElevatedButton(
                onPressed: () {
                  Provider.of<AuthService>(context, listen: false).signInWithGoogle();
                },
                child: Text(
                  "Sign In With Google",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                  ),
                ),
                style: ButtonStyle(
                  padding: MaterialStateProperty.all(EdgeInsets.all(10.0)),
                  backgroundColor: MaterialStateProperty.all(Colors.black),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
