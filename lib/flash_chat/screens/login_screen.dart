import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';
import 'package:todoey_flutter/flash_chat/components/rounded_button.dart';
import 'package:todoey_flutter/flash_chat/constants.dart';

import 'chat_screen.dart';

class LoginScreen extends StatefulWidget {
  static String id = 'login';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  String email = 'ainhoa@email.com';
  String password = '123456';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leadingWidth: 80,
        leading: Container(
          child: IconButton(
            alignment: Alignment.topCenter,
            iconSize: 40,
            onPressed: () => {Navigator.pop(context)},
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: ProgressHUD(
        child: Builder(builder: (context) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Hero(
                  tag: 'logo',
                  child: Container(
                    height: 200.0,
                    child: Image.asset('images/logo.png'),
                  ),
                ),
                SizedBox(
                  height: 48.0,
                ),
                TextField(
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.emailAddress,
                  onChanged: (value) {
                    email = value;
                  },
                  decoration: kTextFieldDecoration.copyWith(
                    hintText: 'Enter your email',
                  ),
                ),
                SizedBox(
                  height: 8.0,
                ),
                TextField(
                  textAlign: TextAlign.center,
                  obscureText: true,
                  onChanged: (value) {
                    password = value;
                  },
                  decoration: kTextFieldDecoration.copyWith(
                    hintText: 'Enter your password.',
                  ),
                ),
                SizedBox(
                  height: 24.0,
                ),
                RoundedButton(
                  text: 'Log In',
                  color: Colors.lightBlueAccent,
                  callback: () async {
                    final progress = ProgressHUD.of(context);
                    progress?.show();
                    try {
                      var userCredentials =
                          await _auth.signInWithEmailAndPassword(
                              email: email, password: password);
                      progress?.dismiss();
                      if (userCredentials.user != null) {
                        Navigator.pushNamed(context, ChatScreen.id);
                      }
                    } catch (e) {
                      print(e);
                      progress?.dismiss();
                    }
                  },
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
