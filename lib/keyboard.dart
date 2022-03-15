// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Keyboard extends ChangeNotifier {

  String currentValue = "Try my keyboard!";
  bool firstInput = true;

  void updateValue(String addedValue) {
    if (firstInput) {
      firstInput = false;
      currentValue = addedValue;
      notifyListeners();
    }
    else {
      currentValue += addedValue;
      notifyListeners();
    }
  }

  void deleteLast() {
    if (currentValue != "Try my keyboard!" && currentValue.length > 1) {
      currentValue = currentValue.substring(0, currentValue.length-1);
    }
    else {
      currentValue = "Try my keyboard!";
      firstInput = true;
    }
    notifyListeners();
  }

  void reset() {
    firstInput = true;
    currentValue = "Try my keyboard!";
  }
}

class LetterKey extends StatelessWidget {

  LetterKey({Key? key, required this.value}) : super(key: key);

  final String value;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(3.0),
      child: SizedBox(
        width: 30.0,
        height: 40.0,
        child: ElevatedButton(
          child: Text(
            value,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16.0,
              color: Colors.white,
            ),
          ),
          onPressed: () {
            Provider.of<Keyboard>(context, listen: false).updateValue(value);
          },
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.all(0.0),
            primary: Colors.black,
          ),
        ),
      ),
    );
  }
}

class EnterKey extends StatelessWidget {

  EnterKey({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(3.0),
      child: SizedBox(
        width: 60.0,
        height: 40.0,
        child: ElevatedButton(
          child: Text(
            "Enter",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16.0,
              color: Colors.white,
            ),
          ),
          onPressed: () {
            Provider.of<Keyboard>(context, listen: false).updateValue("\n");
          },
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.all(0.0),
            primary: Colors.black,
          ),
        ),
      ),
    );
  }
}

class DeleteKey extends StatelessWidget {

  DeleteKey({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(3.0),
      child: SizedBox(
        width: 40.0,
        height: 40.0,
        child: ElevatedButton(
          child: Text(
            "Del",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16.0,
              color: Colors.white,
            ),
          ),
          onPressed: () {
            Provider.of<Keyboard>(context, listen: false).deleteLast();
          },
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.all(0.0),
            primary: Colors.black,
          ),
        ),
      ),
    );
  }
}
