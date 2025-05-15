import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ignisafe/Zones.dart';
import 'package:ignisafe/admin_dashboard.dart';
import 'package:ignisafe/auth_screen.dart';
import 'package:ignisafe/Alert_Details.dart';
import 'package:ignisafe/dash.dart';
import 'package:ignisafe/loading_screen.dart';
import 'package:ignisafe/zone1.dart';
import 'splash_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, _) => const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // Start with SplashScreen, then navigate to LoadPage -> AuthScreen
      home:GasLevelsScreen(),
      routes: {
        '/load': (context) => const LoadPage(), // Optional named route
        '/auth': (context) => AuthScreen(),
      },
    );
  }
}