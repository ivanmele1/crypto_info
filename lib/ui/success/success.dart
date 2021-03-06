import 'package:cryptoinfo/components/rounded_btn/rounded_btn.dart';
import 'package:cryptoinfo/ui/cryptos/first_screen.dart';
import 'package:cryptoinfo/ui/news/news.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:confetti/confetti.dart';
import 'dart:math';
import 'package:cryptoinfo/constants.dart' as Constants;

class SuccessScreen extends StatefulWidget {
  @override
  _SuccessScreenState createState() => _SuccessScreenState();
}

class _SuccessScreenState extends State<SuccessScreen> {
  ConfettiController _controllerBottomCenter;

  @override
  void initState() {
    ConfettiController(duration: const Duration(seconds: 5));
    _controllerBottomCenter =
        ConfettiController(duration: const Duration(seconds: 10));
    WidgetsBinding.instance
        .addPostFrameCallback((_) => _controllerBottomCenter.play());
    super.initState();
  }

  @override
  void dispose() {
    _controllerBottomCenter.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(Constants.COLOR_BACKGROUND_DARK),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: ConfettiWidget(
              confettiController: _controllerBottomCenter,
              blastDirection: pi / 2,
              maxBlastForce: 3, // set a lower max blast force
              minBlastForce: 2,
              emissionFrequency: 0.3,
              minimumSize: const Size(10,
                  10), // set the minimum potential size for the confetti (width, height)
              maximumSize: const Size(20,
                  20), // set the maximum potential size for the confetti (width, height)
              numberOfParticles: 1,
              gravity: 1,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text('Welcome,',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 27
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('What do you want to see?',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 23
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: RoundedButton(
                btnText: 'Crypto List',
                color:Color(Constants.COLOR_PRIMARY_YELLOW),
                onPressed: () async {

                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => FirstScreen()));
                },
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: RoundedButton(
                btnText: 'News',
                color:Color(Constants.COLOR_PRIMARY_YELLOW),
                onPressed: () async {

                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => NewsScreen()));
                },
              ),
            ),
          ),
          SizedBox(
              height: 200,
              width: 200,
              child: SvgPicture.asset('images/success.svg')),
        ],
      ),
    );
  }
}