import 'dart:convert';

import 'package:http/http.dart' as http;

import '../constants.dart';

class ApiService {
  Future<String> getSeller(String token) async {
    try {
      String apiUrl =
          '$URL_API_SELLER/getSeller/token/$token'; // l'URL de l'API
      final response = await http.get(Uri.parse(apiUrl));
      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        //final token = jsonData['token'] as String;
        final first_name = jsonData['first_name'] as String;
        return first_name;
      } else {
        throw Exception('Erreur de requête : ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Erreur de connexion : $e');
    }
  }

  Future<String> connectionSeller(String email) async {
    try {
      String apiUrl =
          '$URL_API_SELLER/connection_seller?email=$email'; // l'URL de l'API
      final response = await http.get(Uri.parse(apiUrl));
      if (response.statusCode == 200) {
        return "connection successful";
      } else {
        return "connection failed";
      }
    } catch (e) {
      throw Exception('Erreur de connexion : $e');
    }
  }
}
