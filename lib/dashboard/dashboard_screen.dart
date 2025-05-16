import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class DashboardScreen extends StatelessWidget {
  final String token;
  final String role;

  const DashboardScreen({super.key, required this.token, required this.role});

  Future<void> _fetchProtectedData(BuildContext context) async {
    try {
      final response = await http.get(
        Uri.parse('https://6b47-102-189-166-191.ngrok-free.app/api/protected'),
        headers: {
          'Authorization': 'Bearer $token',
        },
      );

      if (response.statusCode == 200) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Data fetched successfully!')),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: ${e.toString()}')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard ($role)'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Welcome!', style: TextStyle(fontSize: 24)),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _fetchProtectedData(context),
              child: Text('Fetch Protected Data'),
            ),
          ],
        ),
      ),
    );
  }
}