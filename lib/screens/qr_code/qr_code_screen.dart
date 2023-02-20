import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:appmobile/services/readqr.dart';
import 'package:appmobile/services/api_service.dart';

class Qr_code_Screen extends StatefulWidget {
  @override
  _ScanScreenState createState() => _ScanScreenState();
}

class _ScanScreenState extends State<Qr_code_Screen> {
  var height, width;

  @override
  Widget build(BuildContext context) {
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
                      final apiService = ApiService();
                      apiService.getSeller(qrResult).then((seller) {
                        // Utiliser le résultat de la fonction getSeller ici
                      });
                    });
                  },
                  child: Text(('Scanner'))),
              SizedBox(
                height: width,
              )
            ],
          ),
        ));
  }
}
