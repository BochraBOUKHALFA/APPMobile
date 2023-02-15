import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiService {

  Future<String> getSeller(String token) async {
    try {
      String apiUrl = 'http://127.0.0.1:5000/getSeller/$token'; // l'URL de l'API
      final response = await http.get(Uri.parse(apiUrl));
      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        //final token = jsonData['token'] as String;
        final firstName = jsonData['firstName'] as String;
        return "Bienvenue $firstName";
      } else {
        throw Exception('Erreur de requête : ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Erreur de connexion : $e');
    }
  }
}
