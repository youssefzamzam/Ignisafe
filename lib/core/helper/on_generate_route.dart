import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:ignisafe/features/alerts/presentation/views/alerts_view.dart';
import 'package:ignisafe/features/auth/presentation/views/auth_view.dart';
import 'package:ignisafe/features/dashboard/presentation/views/dashboard_view.dart';
import 'package:ignisafe/features/zones/presentation/views/zones_view.dart';
import 'package:ignisafe/loading_view.dart';
import 'package:ignisafe/features/management%20users/presentation/views/managementusers_view.dart';
import 'package:ignisafe/features/splash/splash_view.dart';

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

    case DashboardView.routeName:
      return CupertinoPageRoute(builder: (context) => const DashboardView());

    case ManagementUsersView.routeName:
      return CupertinoPageRoute(builder: (context) => const ManagementUsersView());

    case ZonesView.routeName:
      return CupertinoPageRoute(builder: (context) => const ZonesView());
      

    default:
      return CupertinoPageRoute(
        builder: (context) => const Center(child: CircularProgressIndicator()),
      );
  }
}
