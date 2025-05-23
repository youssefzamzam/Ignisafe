import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:ignisafe/alerts/presentation/views/alerts_view.dart';
import 'package:ignisafe/auth/presentation/views/auth_view.dart';
import 'package:ignisafe/loading_view.dart';
import 'package:ignisafe/splash/splash_view.dart';

import '../../management users/presentation/views/managementusers_view.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case SplashView.routeName:
      return CupertinoPageRoute(builder: (context) => const SplashView());

    case LoadView.routeName:
      return CupertinoPageRoute(builder: (context) => const LoadView());

    case AuthView.routeName:
      return CupertinoPageRoute(builder: (context) => const AuthView());

    case AlertsView.routeName:
      return CupertinoPageRoute(builder: (context) => const AlertsView());

    case ManagementUsersView.routeName:
      return CupertinoPageRoute(builder: (context) => const ManagementUsersView());


    default:
      return CupertinoPageRoute(builder: (context) => const Scaffold());
  }
}
