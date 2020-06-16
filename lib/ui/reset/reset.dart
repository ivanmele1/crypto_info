import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:toast/toast.dart';
import 'package:cryptoinfo/constants.dart' as Constants;

class Reset extends StatefulWidget {
  @override
  _ResetState createState() => _ResetState();
}

class _ResetState extends State<Reset> {
  final GlobalKey<FormState> _ResetForm = GlobalKey<FormState>();
  String _email;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Reset Password',
          style: TextStyle(
              color: Color(Constants.COLOR_PRIMARY_YELLOW),
              fontWeight: FontWeight.w600,
              fontSize: 20
          ),
          ),
          backgroundColor: Color(Constants.COLOR_BACKGROUND_DARK),
        ),
        body: Container(
          padding: EdgeInsets.all(20),
          child: Form(
              key: _ResetForm,
              child: Column(
                children: <Widget>[
                  TextFormField(
                    validator: (input) {
                      if (input.isEmpty) {
                        return 'email cannot be empty';
                      }
                    },
                    onSaved: (input) {
                      _email = input;
                    },
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                        hintText: 'Email',
                        contentPadding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20))),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      padding: EdgeInsets.all(15),
                      color: Color(Constants.COLOR_PRIMARY_YELLOW),
                      child: Text(
                        'Reset Password',
                        style: TextStyle(color: Color(Constants.COLOR_BACKGROUND_DARK)),
                      ),
                      onPressed: ResetPassword,
                    ),
                  )
                ],
              )
          ),
        ),
      ),
    );
  }

  void ResetPassword() async {
    final _resetState = _ResetForm.currentState;
    if (_resetState.validate()) {
      _resetState.save();
      try {
        FirebaseAuth.instance.sendPasswordResetEmail(email: _email);
        Navigator.of(context).pop();
      } catch (e) {
        Toast.show(e.message, context,
            duration: 2, gravity: Toast.CENTER, backgroundColor: Colors.orange);
      }
    }
  }
}