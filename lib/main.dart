import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ignisafe/auth/presentation/views/auth_view.dart';
import 'package:ignisafe/core/helper/on_generate_route.dart';
import 'package:ignisafe/core/utils/themes.dart';
import 'package:ignisafe/splash/splash_view.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(Ignisafe());
}

class Ignisafe extends StatefulWidget {
  const Ignisafe({super.key});

  @override
  State<Ignisafe> createState() => _IgnisafeState();
}

class _IgnisafeState extends State<Ignisafe> {
  ThemeMode _themeMode = ThemeMode.system;

  void toggleTheme() {
    setState(() {
      _themeMode = _themeMode == ThemeMode.dark ? ThemeMode.light : ThemeMode.dark;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(428, 926),
      minTextAdapt: true,
      splitScreenMode: true,
      builder:
          (context, _) => MaterialApp(
            debugShowCheckedModeBanner: false,
            onGenerateRoute: onGenerateRoute,
            initialRoute: AuthView.routeName,
            theme: lightTheme,
            darkTheme: darkTheme,
            themeMode: _themeMode,
            title: 'Ignisafe',
          ),
    );
  }
}
