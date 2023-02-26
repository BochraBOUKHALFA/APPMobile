import 'package:appmobile/constants.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../services/api_service.dart';
import '../qr_code/qr_code_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Insert Your Email',
      home: EmailScreen(),
    );
  }
}

class EmailScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Bienvenue',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold, // mettre le texte en gras
                color: kTextColor,
              ),
            ),
            const SizedBox(height: 18),
            Container(
              width: 350,
              child: TextField(
                controller: emailController,
                decoration: const InputDecoration(
                  hintText: 'Entrer votre email',
                ),
              ),
            ),
            const SizedBox(height: 22),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: kPrimaryColor, // changer la couleur de fond du bouton
                minimumSize: const Size(150, 75), // agrandir le bouton
              ),
              onPressed: () async {
                String email = emailController.text;
                final apiService = ApiService();
                String response = await apiService.connectionSeller(email);
                if(response == "connection successful") {
                Fluttertoast.showToast(
                    msg: "Vérification réussie, consultez vos mails",
                    toastLength: Toast.LENGTH_LONG,
                    gravity: ToastGravity.TOP,
                    backgroundColor: Colors.green,
                    textColor: Colors.white,
                    fontSize: 16.0);
                Navigator.push(context, MaterialPageRoute(builder: (context) => Qr_code_Screen()));
                } else {
                  Fluttertoast.showToast(
                    msg: "Vérification échouée",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.TOP,
                    backgroundColor: Color.fromARGB(255, 170, 24, 27),
                    textColor: Colors.white,
                    fontSize: 16.0);
                }
              },
              child: const Text('Entrer'),
            ),
          ],
        ),
      ),
    );
  }
}
