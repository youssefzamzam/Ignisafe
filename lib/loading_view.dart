import 'package:flutter/material.dart';
import 'package:ignisafe/auth/auth_view.dart';

class LoadView extends StatelessWidget {
  const LoadView({super.key});
  static const routeName = 'LoadView';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF181818),
      body: NotificationListener<ScrollNotification>(
        onNotification: (scrollNotification) {
          if (scrollNotification is ScrollEndNotification) {
            if (scrollNotification.metrics.pixels == scrollNotification.metrics.maxScrollExtent) {
              Navigator.of(context).pushNamed(AuthView.routeName);
            }
          }
          return true;
        },
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 1.2,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(child: Image.asset('assets/images/Frame 36.png', height: 120, scale: 2)),
                  const SizedBox(height: 40),

                  // Detect Early - WHITE
                  _buildFeatureText('Detect Early', color: Color(0xFFEEE6E6)),
                  const SizedBox(height: 5),

                  // Respond Faster - WHITE
                  _buildFeatureText('Respond Faster', color: Color(0xFFEEE6E6)),
                  const SizedBox(height: 5),

                  // Stay Safe - RED
                  _buildFeatureText('Stay Safe', color: Color(0xFAD60A0A)),

                  const SizedBox(height: 5),
                  Center(child: Image.asset('assets/images/Frame 68.png', scale: 3)),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildFeatureText(String text, {required Color color}) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: 'Projectfont',
        fontSize: 25,
        fontWeight: FontWeight.w600,
        color: color,
        letterSpacing: 1.2,
      ),
    );
  }
}

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0A0A0A),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/Frame 36.png', height: 100),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
