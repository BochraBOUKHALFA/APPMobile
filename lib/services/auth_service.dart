import 'package:flutter/material.dart';

class AuthService {
  String _expectedToken = "test";

  AuthService({required String expectedToken})
      : assert(expectedToken != null),
        _expectedToken = expectedToken;

  Future<bool> authenticate(String apiToken) async {
    // Compare le token de l'API avec le token attendu
    bool isAuthenticated = apiToken == _expectedToken;
    return isAuthenticated;
  }
}
