import 'package:appmobile/screens/email/email_screen.dart';
import 'package:flutter/material.dart';
import 'package:appmobile/screens/qr_code/qr_code_screen.dart';
import 'package:appmobile/constants.dart';

class PrehomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Future.delayed(Duration(seconds: 5)),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          // Rediriger l'utilisateur vers la page Qr_code_Screen() une fois le délai écoulé
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => SignInPage1()));
        }
        return Scaffold(
          body: Align(
            alignment: Alignment.center,
            child: Container(
              color: kBackgroundColor,
              width: 300.0,
              height: 300.0,
              child: Image.asset(
                'images/PayeTonKawa.png',
                fit: BoxFit.contain,
              ),
            ),
          ),
        );
      },
    );
  }
}
