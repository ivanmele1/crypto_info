import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home_Page extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //title: 'Flutter Demo',
        theme: ThemeData(
          primaryColor: Colors.indigo,
        ),
        home: Scaffold(
          appBar: AppBar(
            title: Text("Crypto List"),
          ),
          body: Center(
            child: Text(
              "Aqui van las noticias",
              style: TextStyle(color: Colors.amber, fontSize: 60),
            ),
          ),
        ));
  }
}