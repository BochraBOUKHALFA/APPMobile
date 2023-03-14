import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Coffee Machine',
          style: TextStyle(
              color: Colors.black, fontSize: 28, fontStyle: FontStyle.italic),
        ),
        centerTitle: true,
        elevation: 0.1,
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: WebviewScaffold(
                  url: 'https://app.vectary.com/p/4j9qXY8W5J1CQkNUBfXGKZ'),
            ),
            Text(
              'Coffee Machine',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 25),
            ),
            Expanded(
              child: Text(
                '''Product details
Package Dimensions ‏ : ‎ 29 x 23 x 11 cm; 1 Kilograms
Date First Available ‏ : ‎ 7 December 2021
Manufacturer ‏ : ‎ Dejavu
ASIN ‏ : ‎ B09N7QF9S6
Item model number ‏ : ‎ PMA-DVTT-010
Department ‏ : ‎ Womens''',
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
