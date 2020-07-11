import 'package:cryptoinfo/components/rounded_btn/rounded_btn.dart';
import 'package:cryptoinfo/ui/login/login.dart';
import 'package:cryptoinfo/ui/success/success.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:cryptoinfo/constants.dart' as Constants;

class CreateAccount extends StatefulWidget {
  @override
  _CreateAccountState createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  bool showSpinner = false;
  final _auth = FirebaseAuth.instance;
  String email;
  String password;

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: showSpinner,
      child: Scaffold(
        resizeToAvoidBottomPadding: true,
        appBar: AppBar(
          elevation: 0,
            leading: _goBackButton(context),
          backgroundColor:Color(Constants.COLOR_BACKGROUND_DARK),
        ),
        backgroundColor: Color(Constants.COLOR_BACKGROUND_DARK),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 8),
                child: Text('Create Account',
                  style: TextStyle(
                      color: Color(Constants.COLOR_PRIMARY_YELLOW),
                      fontWeight: FontWeight.w600,
                      fontSize: 25
                  ),),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'E-mail',
                      style: TextStyle(fontWeight: FontWeight.w300, fontSize: 13, color: Color(Constants.COLOR_PRIMARY_YELLOW)),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextField(
                      style: (TextStyle(
                          color: Color(Constants.COLOR_PRIMARY_YELLOW),
                          fontWeight: FontWeight.w400
                      )),
                      keyboardType: TextInputType.emailAddress,
                      obscureText: false,
                      cursorColor: Color(Constants.COLOR_PRIMARY_YELLOW),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        fillColor: Color(0xfff3B324E),
                        filled: true,
                        prefixIcon: Image.asset('assets/images/icon_email.png'),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(Constants.COLOR_PRIMARY_YELLOW), width: 2.0),
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      ),
                    ),
                      onChanged: (value) {
                        email = value;
                      },
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Password',
                      style: TextStyle(fontWeight: FontWeight.w300, fontSize: 13, color: Color(Constants.COLOR_PRIMARY_YELLOW)),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextField(
                      style: (TextStyle(
                          color: Color(Constants.COLOR_PRIMARY_YELLOW),
                          fontWeight: FontWeight.w400
                      )),
                      obscureText: true,
                      cursorColor: Color(Constants.COLOR_PRIMARY_YELLOW),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        fillColor: Color(0xfff3B324E),
                        filled: true,
                        prefixIcon: Image.asset('assets/images/icon_lock.png'),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(Constants.COLOR_PRIMARY_YELLOW), width: 2.0),
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        ),
                      ),
                      onChanged: (value) {
                        password = value;
                      },
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: RoundedButton(
                    btnText: 'SIGN UP',
                    color: Color(Constants.COLOR_PRIMARY_YELLOW),
                    onPressed: () async {
                      setState(() {
                        showSpinner = true;
                      });
                      try {
                        final newUser =
                        await _auth.createUserWithEmailAndPassword(
                            email: email, password: password);
                        if (newUser != null) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SuccessScreen()));
                        }

                        setState(() {
                          showSpinner = false;
                        });
                      } catch (e) {
                        print(e);
                      }
                      // Add login code
                    },
                  ),
                ),
              ),
              SizedBox(
                height: 100,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Already have an account?',
                    style: TextStyle(
                        color: Colors.grey[600],
                        fontWeight: FontWeight.w400
                    ),),
                  FlatButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Login()));
                    },
                    child: Text('Sign in',
                        style: TextStyle(
                          color: Color(Constants.COLOR_PRIMARY_YELLOW),)
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

Widget _goBackButton(BuildContext context) {
  return IconButton(
      icon: Icon(Icons.arrow_back, color: Colors.grey[350]),
      onPressed: () {
        Navigator.of(context).pop(true);
      });
}
