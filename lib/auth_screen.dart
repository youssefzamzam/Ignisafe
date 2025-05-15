import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'dashboard_screen.dart';

class AuthScreen extends StatefulWidget {
  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _idController = TextEditingController();
  final _storage = FlutterSecureStorage();
  bool _isLoading = false;
  String _errorMessage = '';
  String? _authToken;
  String? _userRole;

  Future<void> _signIn() async {
    setState(() {
      _isLoading = true;
      _errorMessage = '';
    });

    try {
      final response = await http.post(
        Uri.parse('https://6b47-102-189-166-191.ngrok-free.app/Auth/login'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
        body: json.encode({
          'id': _idController.text,
          'name': _nameController.text,
        }),
      );

      final responseData = json.decode(response.body);

      if (response.statusCode == 200) {
        // Save token and role
        _authToken = responseData['token'];
        _userRole = responseData['role'];

        // Secure storage
        await _storage.write(key: 'jwt_token', value: _authToken);
        await _storage.write(key: 'user_role', value: _userRole);

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Login successful!')),
        );

        // Navigate to Dashboard
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => DashboardScreen(
              token: _authToken!,
              role: _userRole!,
            ),
          ),
        );
      } else {
        setState(() {
          _errorMessage = responseData['message'] ?? 'Login failed';
        });
      }
    } catch (error) {
      setState(() {
        _errorMessage = 'Connection error: $error';
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff181818),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  "Sign In",
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.w400, color: Colors.white,fontFamily:'Projectfont'),
                ),
              ),
              SizedBox(height: 170),

              // Name Field
              Text(
                "Name",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              TextField(
                controller: _nameController,
                decoration: InputDecoration(
                  hintText: "Enter your name",
                  hintStyle: TextStyle(color: Color(0xff9B9B9B)),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                ),
                style: TextStyle(color: Colors.white),
              ),
              SizedBox(height: 20),

              // ID Field
              Text(
                "ID",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              TextField(
                controller: _idController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: "Enter Your ID",
                  hintStyle: TextStyle(color: Color(0xff9B9B9B)),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                ),
                style: TextStyle(color: Colors.white),
              ),
              SizedBox(height: 20),

              if (_errorMessage.isNotEmpty)
                Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: Text(
                    _errorMessage,
                    style: TextStyle(color: Colors.red),
                  ),
                ),

              SizedBox(height: 30),

              Center(
                child: Text(
                  "contact with administrator !",
                  style: TextStyle(color: Colors.white38, fontSize: 18,fontWeight:FontWeight.w400 ),
                ),
              ),
              SizedBox(height: 150),

              Center(
                child: _isLoading
                    ? CircularProgressIndicator(color: Colors.greenAccent)
                    : ElevatedButton(
                  onPressed: _signIn,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.greenAccent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 52, vertical: 12),
                  ),
                  child: Text(
                    "Sign in",
                    style: TextStyle(color: Color(0xFF181818), fontSize: 17 ,fontFamily: 'Projectfont'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _idController.dispose();
    super.dispose();
  }
}