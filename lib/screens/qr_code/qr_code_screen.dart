import 'package:appmobile/screens/home/HomePage.dart';
import 'package:flutter/material.dart';
import 'package:appmobile/services/readqr.dart';
import 'package:appmobile/services/api_service.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:appmobile/constants.dart';
import 'package:http/http.dart' as http;


class Qr_code_Screen extends StatefulWidget {
  @override
  _ScanScreenState createState() => _ScanScreenState();
}

class _ScanScreenState extends State<Qr_code_Screen> {
  var height, width;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    http.Client client = http.Client();
    String qrCode = '';
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/Kaka.PNG'),
            fit: BoxFit.cover,
            alignment: Alignment.topCenter,
          ),
        ),
        key: _formKey,
        child: Center(
          child: Container(
            padding: const EdgeInsets.all(50.0),
            constraints: const BoxConstraints(maxWidth: 400),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 40),
                  Image.asset(
                    'assets/images/Mon_projet_12.png',
                  ),
                  _gap(),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text(
                      "Scanner le QR Code !",
                      style: Theme.of(context).textTheme.headline5,
                      selectionColor: kPrimaryColor,
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: 40),
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: kPrimaryColor,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4),
                            ),
                            primary: Colors.transparent,
                            shadowColor: Colors.transparent,
                          ),
                          child: const Padding(
                            padding: EdgeInsets.all(15.0),
                            child: Text(
                              'Ici',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                          ),
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
                                  MaterialPageRoute(
                                      builder: (context) => HomePage()),
                                );
                              }).catchError((error) {
                                Fluttertoast.showToast(
                                    msg: "Connexion echouée",
                                    toastLength: Toast.LENGTH_LONG,
                                    gravity: ToastGravity.TOP,
                                    backgroundColor:
                                        Color.fromARGB(255, 185, 29, 29),
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
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 40),
                ],
              ),
            ),
          ),
        ),
      ),
      /* bottomNavigationBar: BottomAppBar(
        child: Image.asset(
          'assets/images/13.png',
          fit: BoxFit.cover,
        ),
      ),*/
    );
  }

  Widget _gap() => const SizedBox(height: 16);
}
