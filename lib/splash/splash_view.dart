import 'package:flutter/material.dart';
import 'package:ignisafe/loading_view.dart';
import 'package:video_player/video_player.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  static const routeName = 'Splash';

  @override
  SplashViewState createState() => SplashViewState();
}

class SplashViewState extends State<SplashView> {
  late VideoPlayerController _controller;
  bool _hasNavigated = false; // Flag to prevent duplicate navigation

  @override
  void initState() {
    super.initState();

    // Initialize the video player
    _controller = VideoPlayerController.asset("assets/videos/splash.mp4")
      ..initialize().then((_) {
        setState(() {}); // Update the UI once initialized
        _controller.play(); // Start playing the video

        // Add timeout to skip after 2 seconds (adjust as needed)
        Future.delayed(const Duration(milliseconds: 1500), () {
          _navigateToNextScreen();
        });
      });

    // Navigate when video ends (fallback)
    _controller.addListener(() {
      if (_controller.value.position >= _controller.value.duration) {
        _navigateToNextScreen();
      }
    });
  }

  void _navigateToNextScreen() {
    if (!_hasNavigated && mounted) {
      _hasNavigated = true;
      Navigator.of(context).pushReplacementNamed(LoadView.routeName);
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child:
            _controller.value.isInitialized
                ? AspectRatio(
                  aspectRatio: _controller.value.aspectRatio,
                  child: VideoPlayer(_controller),
                )
                : const CircularProgressIndicator(),
      ),
    );
  }
}
