import 'package:appmobile/constants.dart';
import 'package:appmobile/screens/details/details_screen.dart';
import 'package:appmobile/screens/email/email_screen.dart';
import 'package:appmobile/screens/prehome/prehome_screen.dart';
import 'package:flutter/material.dart';
import 'package:appmobile/screens/home/home_screen.dart';
//import 'package:appmobile/screens/prehome/prehome_screen.dart';

//import 'package:appmobile/screens/details/details_screen.dart';
import 'package:appmobile/screens/qr_code/qr_code_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'PayTonKawaapp',
      theme: ThemeData(
        scaffoldBackgroundColor: kBackgroundColor,
        primaryColor: kPrimaryColor,
        textTheme: Theme.of(context).textTheme.apply(bodyColor: kTextColor),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: DeatailsScreen(),
    );
  }
}