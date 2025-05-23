import 'package:flutter/material.dart';
import 'package:ignisafe/management%20users/presentation/views/widgets/managementusers_view_body.dart';

class ManagementUsersView extends StatelessWidget {
  const ManagementUsersView({super.key});

  static const routeName = "managementusers";

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: ManagementusersViewBody(),);
  }
}
