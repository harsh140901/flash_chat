import 'package:flash_chat/logiin_screen.dart';
import 'package:flash_chat/registration_screen.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'Buttons.dart';

class WelcomeScreen extends StatefulWidget {
  static const String id = 'welcome_screen';
  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> with SingleTickerProviderStateMixin{
  late AnimationController controller;
  late Animation animation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: Duration(seconds: 1),
        vsync: this,
    );

    animation = ColorTween(
      begin: Colors.blueGrey,end: Colors.white).animate(controller);

    controller.forward();

    controller.addListener(() {
      setState(() {
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: animation.value,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                Flexible(
                  child: Hero(
                    tag: 'logo',
                    child: Container(
                      child: Image.asset('images/logo.png'),
                      height: 60.0   ,
                    ),
                  ),
                ),
                AnimatedTextKit(
                  animatedTexts: [TypewriterAnimatedText('Flash Chat',
                  textStyle: TextStyle(
                    fontSize: 45.0,
                    fontWeight: FontWeight.bold,
                  ),),],

                ),
              ],
            ),
            SizedBox(
              height: 48.0,
            ),
            Buttons(colour: Colors.blue, Buttonlabel: 'Log In',
              onPressed:(){
              Navigator.pushNamed(context, LoginScreen.id);
              },),
            Buttons(colour: Colors.blueAccent,Buttonlabel: 'Register',
            onPressed: (){
              Navigator.pushNamed(context, RegistrationScreen.id);
            },
             ),
          ],
        ),
      ),
    );
  }
}

