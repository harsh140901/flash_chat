import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flash_chat/chat_screen.dart';
import 'package:flash_chat/constants.dart';
import 'package:flutter/material.dart';
import 'Buttons.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginScreen extends StatefulWidget {
  static const String id = 'login_screen';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _auth = FirebaseAuth.instance;
  bool showSpinner = false;
  late String email;
  late String password;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: Padding(
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
                    onChanged: (value) {
                      email = value;
                    },
                    decoration: kInputDecoration.copyWith(hintText: 'Enter Your Email'),
                  ),
              SizedBox(
                height: 8.0,
              ),
              TextField(
                obscureText: true,
                textAlign: TextAlign.center,
                onChanged: (value) {
                  password = value;
                },
                decoration: kInputDecoration.copyWith(
                  hintText: 'Enter Password'
                ),
              ),
              SizedBox(
                height: 24.0,
              ),
              Buttons(colour: Colors.blue, Buttonlabel: 'Log In',
                  onPressed:() async {
                    setState(() {
                      showSpinner = true;
                    });
                try{
                    final previousUser = await _auth.signInWithEmailAndPassword(email: email, password: password);
                    if(previousUser != null) {
                    Navigator.pushNamed(context, ChatScreen.id);
                    }
                    setState(() {
                      showSpinner = false;
                    });
                    }
                    catch(e){
                      print(e);
                    }
                  }),


            ],
          ),
        ),
      ),
    );
  }
}


