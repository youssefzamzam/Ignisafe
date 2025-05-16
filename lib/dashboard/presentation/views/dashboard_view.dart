import 'package:flutter/material.dart';
import 'package:ignisafe/dashboard/presentation/views/widgets/dashboard_view_body.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});
  static const routeName = 'dashboard';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Scaffold(

          body: DashboardViewBody(),
        ),
      ),
    );
  }
}
