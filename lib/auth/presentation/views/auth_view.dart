import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ignisafe/auth/manager/auth_cubit.dart';
import 'package:ignisafe/auth/data/repo/auth_repo.dart';
import 'package:ignisafe/auth/presentation/views/widgets/auth_view_body.dart';


class AuthView extends StatelessWidget {
  const AuthView({super.key});
  static const routeName = 'authView';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(AuthRepository()),
      child: Scaffold(backgroundColor: const Color(0xff181818), body: const AuthViewBody()),
    );
  }
}
