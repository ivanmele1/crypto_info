import 'package:flutter/material.dart';

import 'list_crypto.dart';
import 'package:cryptoinfo/ui/news/news.dart';
import 'package:cryptoinfo/constants.dart' as Constants;


class FirstScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return FirstScreenState();
  }
}

class FirstScreenState extends State<FirstScreen> {

  int _currentIndex=1;
  List<Widget> widgets = [NewsScreen(),ListingScreen()];
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 229, 229, 229),

      appBar: AppBar(
        backgroundColor: Color(Constants.COLOR_BACKGROUND_DARK),
        elevation: 1.0,
        centerTitle: true,
        title: Text(
          'Crypto Info',
          style: TextStyle(
              fontFamily: 'RobotoBold',
              color: Color(Constants.COLOR_PRIMARY_YELLOW),
              fontWeight: FontWeight.bold,
              fontSize: 20.0),
          textAlign: TextAlign.center,
        ),
      ),
      body: widgets[_currentIndex],
    );
  }
}