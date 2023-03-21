import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:test/test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../constants.dart';
import '../services/api_service.dart';
import 'api_service_test.mocks.dart';

@GenerateMocks([http.Client])
void main() {
  group('getSeller', () {
    final mockClient = MockClient();

    test('getSeller returns seller first name when the call completes successfully',
        () async {
      final token = 'token123';
      final firstName = 'John';
      final responseBody = json.encode({'first_name': firstName});

      when(mockClient.get(Uri.parse('$URL_API_SELLER/getSeller/token/$token')))
          .thenAnswer((_) async => http.Response(responseBody, 200));

      final result = await getSeller(mockClient, token);

      expect(result, equals(firstName));
      verify(
          mockClient.get(Uri.parse('$URL_API_SELLER/getSeller/token/$token')));
    });

    test('getSeller throws an exception when the call fails', () async {
      final token = 'token123';

      when(mockClient.get(Uri.parse('$URL_API_SELLER/getSeller/token/$token')))
          .thenAnswer((_) async => http.Response('Error', 500));

      expect(() => getSeller(mockClient, token), throwsException);
      verify(
          mockClient.get(Uri.parse('$URL_API_SELLER/getSeller/token/$token')));
    });
  });

    group('connectionSeller', () {
    final mockClient = MockClient();

    test('connectionSeller returns connection successful when the call completes successfully',
        () async {
      final email = 'john@epsi.fr';
      final responseBody = "connection successful";

      when(mockClient.get(Uri.parse('$URL_API_SELLER/connection_seller?email=$email')))
          .thenAnswer((_) async => http.Response(responseBody, 200));

      final result = await connectionSeller(mockClient, email);

      expect(result, equals("connection successful"));
      verify(
          mockClient.get(Uri.parse('$URL_API_SELLER/connection_seller?email=$email')));
    });

    test('connectionSeller returns connection failed if response is not 200', () async {
      
      final bad_email = 'bademail@epsi.fr';
      final responseBody = "FAILED";

      when(mockClient.get(Uri.parse('$URL_API_SELLER/connection_seller?email=$bad_email')))
          .thenAnswer((_) async => http.Response(responseBody, 404));

      final result = await connectionSeller(mockClient, bad_email);
      
      expect(result, equals("FAILED"));
      verify(
          mockClient.get(Uri.parse('$URL_API_SELLER/connection_seller?email=$bad_email')));
    });

    test('connectionSeller throws an exception when the call fails', () async {
      final email = 'randomemail@test.fr';

      when(mockClient.get(Uri.parse('$URL_API_SELLER/connection_seller?email=$email')))
          .thenAnswer((_) async => http.Response('Error', 500));

      expect(() => getSeller(mockClient, email), throwsException);
    });
  });
}
