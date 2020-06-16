import 'dart:async';

import 'package:cryptoinfo/ui/login/login.dart';
import 'package:flutter/material.dart';
import 'package:cryptoinfo/constants.dart' as Constants;

class SplashScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => StartState();
}

class StartState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return initScreen(context);
  }


  @override
  void initState() {
    super.initState();
    startTimer();
  }

  startTimer() async {
    var duration = Duration(seconds: 5);
    return new Timer(duration, route);
  }

  route() {
    Navigator.pushReplacement(context, MaterialPageRoute(
        builder: (context) => Login()
    )
    );
  }

  initScreen(BuildContext context) {

    return Scaffold(
      backgroundColor: Color(Constants.COLOR_BACKGROUND_DARK),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              child: Image.asset('assets/images/crypto.png'),
            ),
            Padding(padding: EdgeInsets.only(top: 20.0)),
            Text(
              "Crypto Info",
              style: TextStyle(
                  fontSize: 40.0,
                  color:Color(Constants.COLOR_PRIMARY_YELLOW)
              ),
            ),
            Padding(padding: EdgeInsets.only(top: 20.0)),

            CircularProgressIndicator(
              backgroundColor: Colors.white,
              strokeWidth: 1,
            )
          ],
        ),
      ),
    );
  }
}