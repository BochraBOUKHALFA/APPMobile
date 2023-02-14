import 'package:flutter/material.dart';

class PrehomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Align(
        alignment: Alignment.center,
        child: Container(
          width: 10.0,
          height: 10.0,
          child: Image.asset(
            'images/PayeTonKahwa_logo.png',
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}
