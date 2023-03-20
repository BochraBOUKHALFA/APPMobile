import 'package:appmobile/screens/details/AR.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:appmobile/ApiData/Data.dart';

class DetailsScreen extends StatelessWidget {
  final Data product;

  const DetailsScreen({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          product.name ?? '',
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
              product.name ?? '',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 25),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(top: 20.0, left: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                      text: TextSpan(
                        style: TextStyle(color: Colors.black),
                        children: [
                          TextSpan(
                            text: 'Color: ',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          TextSpan(text: '${product.color ?? ''}'),
                        ],
                      ),
                    ),
                    SizedBox(height: 8.0),
                    RichText(
                      text: TextSpan(
                        style: TextStyle(color: Colors.black),
                        children: [
                          TextSpan(
                            text: 'Price: ',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          TextSpan(text: '${product.price ?? ''}'),
                        ],
                      ),
                    ),
                    SizedBox(height: 8.0),
                    RichText(
                      text: TextSpan(
                        style: TextStyle(color: Colors.black),
                        children: [
                          TextSpan(
                            text: 'Description: ',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          TextSpan(text: '${product.description ?? ''}'),
                        ],
                      ),
                    ),
                    SizedBox(height: 16.0),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.brown, // background color
                        onPrimary: Colors.white, // foreground color
                      ),
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => ARScreen()),
                        );
                      },
                      child: Text('Réalité augmentée'),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
