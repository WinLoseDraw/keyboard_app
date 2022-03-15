// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'firebase_auth.dart';
import 'keyboard.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Home Page",
          style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 24.0,
            ),
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                Provider.of<AuthService>(context, listen: false).signOutFromGoogle();
                Provider.of<Keyboard>(context, listen: false).reset();
              },
              child: Text(
                "Sign Out",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16.0,
                ),
              ),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.cyan),
              ),
            ),
          ],
        ),
        body: Center(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.all(20.0),
                padding: EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  color: Colors.cyanAccent,
                  border: Border.all(color: Colors.cyan, style: BorderStyle.solid, width: 5.0),
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                ),
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.all(10.0),
                      child: Text(
                        Provider.of<AuthService>(context, listen: false).username,
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Text(
                      Provider.of<AuthService>(context, listen: false).userID,
                      style: TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 20.0),
                  padding: EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.red, style: BorderStyle.solid, width: 5.0),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                          child: Text(
                          Provider.of<Keyboard>(context).currentValue,
                          style: TextStyle(
                            fontSize: 16.0,
                          ),
                        ),
                      ),
                    ],
                  )
                ),
              ),
              Container(
                margin: EdgeInsets.all(10.0),
                padding: EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        LetterKey(value: "Q"),
                        LetterKey(value: "W"),
                        LetterKey(value: "E"),
                        LetterKey(value: "R"),
                        LetterKey(value: "T"),
                        LetterKey(value: "Y"),
                        LetterKey(value: "U"),
                        LetterKey(value: "I"),
                        LetterKey(value: "O"),
                        LetterKey(value: "P"),
                      ],
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 20.0,
                          height: 40.0,
                        ),
                        LetterKey(value: "A"),
                        LetterKey(value: "S"),
                        LetterKey(value: "D"),
                        LetterKey(value: "F"),
                        LetterKey(value: "G"),
                        LetterKey(value: "H"),
                        LetterKey(value: "J"),
                        LetterKey(value: "K"),
                        LetterKey(value: "L"),
                      ],
                    ),
                    Row(
                      children: [
                        EnterKey(),
                        LetterKey(value: "Z"),
                        LetterKey(value: "X"),
                        LetterKey(value: "C"),
                        LetterKey(value: "V"),
                        LetterKey(value: "B"),
                        LetterKey(value: "N"),
                        LetterKey(value: "M"),
                        DeleteKey(),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        )
    );
  }
}
