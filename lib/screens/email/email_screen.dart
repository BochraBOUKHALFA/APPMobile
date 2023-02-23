import 'package:appmobile/constants.dart';
import 'package:flutter/material.dart';

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
            Text(
              'Bienvenue!',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold, // mettre le texte en gras
                color: kTextColor,
              ),
            ),
            SizedBox(height: 18),
            Container(
              width: 350,
              child: TextField(
                controller: emailController,
                decoration: InputDecoration(
                  hintText: 'Entrer votre email',
                ),
              ),
            ),
            SizedBox(height: 22),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: kPrimaryColor, // changer la couleur de fond du bouton
                minimumSize: Size(150, 75), // agrandir le bouton
              ),
              onPressed: () {
                // TODO: Add email submission logic
              },
              child: Text('Entrer'),
            ),
          ],
        ),
      ),
    );
  }
}
