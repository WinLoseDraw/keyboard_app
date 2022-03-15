// ignore_for_file: prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:state_manager/sign_in_page.dart';
import 'home_page.dart';

class AuthCheckWidget extends StatelessWidget {
  const AuthCheckWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (BuildContext context, AsyncSnapshot<User?> snapshot) {
          if (snapshot.hasData) {
            return HomePage();
          }
          else {
            return SignInPage();
          }
        },
      ),
    );
  }
}
