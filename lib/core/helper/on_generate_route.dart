import 'package:flutter/material.dart';

import 'package:flutter/cupertino.dart';
import 'package:ignisafe/auth/auth_view.dart';
import 'package:ignisafe/loading_view.dart';
import 'package:ignisafe/splash/splash_view.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case SplashView.routeName:
      return CupertinoPageRoute(builder: (context) => const SplashView());

    case LoadView.routeName:
      return CupertinoPageRoute(builder: (context) => const LoadView());

    case AuthView.routeName:
      return CupertinoPageRoute(builder: (context) => const AuthView());


    default:
      return CupertinoPageRoute(builder: (context) => const Scaffold());
  }
}
