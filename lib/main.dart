import 'package:appmobile/services/api_service.dart';
import 'package:flutter/material.dart';
import 'screens/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final ApiService _apiService = ApiService();
  // final AuthService _authService = AuthService();
  String token = "4bMblKC2lU";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My App',
      home: FutureBuilder(
        future: _apiService.getSeller(token), // get the seller if he exists
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              return Text('Erreur de connexion');
            } else {
              // authentifier le token
              return HomePage(); // afficher la page d'accueil
            }
          } else {
            return CircularProgressIndicator(); // afficher une icône de chargement
          }
        },
      ),
    );
  }
}
