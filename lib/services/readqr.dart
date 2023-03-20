import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';



Future<String> scanQr() async {
    var qrstr = "let's Scan it";
    try {
      qrstr = await FlutterBarcodeScanner.scanBarcode('#2A99CF', 'cancel', true, ScanMode.QR);
    } catch (e) {
        qrstr = 'unable to read this';
    }
    return qrstr;
  }