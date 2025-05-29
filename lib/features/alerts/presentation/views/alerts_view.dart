import 'package:flutter/material.dart';
import 'package:ignisafe/features/alerts/presentation/views/widgets/alerts_view_body.dart';

class AlertsView extends StatelessWidget {
  const AlertsView({super.key});

  static const routeName = "Alerts";

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: AlertsViewBody());
  }
}
