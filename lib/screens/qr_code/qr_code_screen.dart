import 'package:appmobile/screens/home/HomePage.dart';
import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:appmobile/services/readqr.dart';
import 'package:appmobile/services/api_service.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

class Qr_code_Screen extends StatefulWidget {
  @override
  _ScanScreenState createState() => _ScanScreenState();
}

class _ScanScreenState extends State<Qr_code_Screen> {
  var height, width;

  @override
  Widget build(BuildContext context) {
    http.Client client = http.Client();
    String qrCode = '';
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
          title: Text('Scanning QR code'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  scanQr().then((qrResult) {
                    getSeller(client, qrResult).then((first_name) {
                      Fluttertoast.showToast(
                          msg: "Connexion réussie",
                          toastLength: Toast.LENGTH_LONG,
                          gravity: ToastGravity.TOP,
                          backgroundColor: Colors.green,
                          textColor: Colors.white,
                          fontSize: 16.0);
                      // Redirection vers une autre page si la requête réussit
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => HomePage()),
                      );
                    }).catchError((error) {
                      Fluttertoast.showToast(
                          msg: "Connexion echouée",
                          toastLength: Toast.LENGTH_LONG,
                          gravity: ToastGravity.TOP,
                          backgroundColor: Color.fromARGB(255, 185, 29, 29),
                          textColor: Colors.white,
                          fontSize: 16.0);
                      // Redirection vers une autre page si la requête échoue
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Qr_code_Screen()),
                      );
                    });
                  });
                },
                child: Text('Scan QR code'),
              ),
              SizedBox(
                height: width,
              )
            ],
          ),
        ));
  }
}
