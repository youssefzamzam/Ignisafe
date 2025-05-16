import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthRepository {
  final _storage = const FlutterSecureStorage();
  final String _baseUrl = 'https://6b47-102-189-166-191.ngrok-free.app/Auth/login';

  Future<String> login({required String id, required String name}) async {
    final response = await http.post(
      Uri.parse(_baseUrl),
      headers: {'Content-Type': 'application/json'},
      body: json.encode({'id': id, 'name': name}),
    );

    if (response.statusCode == 200) {
      final responseData = json.decode(response.body);
      final token = responseData['token'];
      await _storage.write(key: 'jwt_token', value: token);
      return token;
    } else {
      final responseData = json.decode(response.body);
      throw Exception(responseData['message'] ?? 'Login failed');
    }
  }
}
