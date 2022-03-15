// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_manager/auth_check.dart';
import 'package:state_manager/firebase_auth.dart';

import 'keyboard.dart';

Future main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(
    MultiProvider(
        providers: [
          Provider(
            create: (context) => AuthService(),
          ),
          ChangeNotifierProvider(
              create: (context) => Keyboard()),
        ],
      child: MyApp(),
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AuthCheckWidget(),
    );
  }
}
