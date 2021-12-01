import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Result extends StatefulWidget {
  const Result({Key? key}) : super(key: key);

  @override
  _ResultState createState() => _ResultState();
}

class _ResultState extends State<Result> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Container(
              child: Text(
                "That is a valid",
                style: TextStyle(
                  fontFamily: 'Sf',
                  fontSize: 30,
                  color: Colors.black,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "CREDIT CARD",
              style: TextStyle(
                fontFamily: 'Sf',
                fontSize: 35,
                color: Colors.purple,
              ),
            ),
            SizedBox(
              height: 0.2,
            ),
            new LottieBuilder.asset(
              'assets/success.json',
              height: 500,
            ),
          ],
        ),
      ),
    );
  }
}

//invalid reslut
class Invalid extends StatefulWidget {
  const Invalid({Key? key}) : super(key: key);

  @override
  _InvalidState createState() => _InvalidState();
}

class _InvalidState extends State<Invalid> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Container(
              child: Text(
                "That is not a valid",
                style: TextStyle(
                  fontFamily: 'Sf',
                  fontSize: 30,
                  color: Colors.black,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "CREDIT CARD",
              style: TextStyle(
                fontFamily: 'Sf',
                fontSize: 35,
                color: Colors.purple,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            new LottieBuilder.asset(
              'assets/fail.json',
              height: 400,
            ),
          ],
        ),
      ),
    );
  }
}
