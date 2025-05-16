import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ignisafe/auth/manager/auth_cubit.dart';
import 'package:ignisafe/auth/manager/auth_state.dart';
import 'package:ignisafe/core/utils/custom_snackbar.dart';


class AuthViewBody extends StatefulWidget {
  const AuthViewBody({super.key});

  @override
  State<AuthViewBody> createState() => _AuthViewBodyState();
}

class _AuthViewBodyState extends State<AuthViewBody> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _idController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _idController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                "Sign In",
                style: TextStyle(fontSize: 32.sp, fontWeight: FontWeight.w400, color: Colors.white),
              ),
            ),
            SizedBox(height: 170.h),

            // Name Field
            _buildLabel("Name"),
            _buildTextField(_nameController, "Enter your name"),
            SizedBox(height: 20),

            // ID Field
            _buildLabel("ID"),
            _buildTextField(_idController, "Enter Your ID", TextInputType.number),
            SizedBox(height: 20),

            SizedBox(height: 30),

            Center(
              child: Text(
                "Contact with administrator!",
                style: TextStyle(color: Colors.white38, fontSize: 18, fontWeight: FontWeight.w400),
              ),
            ),
            SizedBox(height: 150),

            BlocConsumer<AuthCubit, AuthState>(
              listener: (context, state) {
                if (state is AuthSuccess) {
                  CustomSnackBar.show(
                    context,
                    message: 'Logged in successfully.',
                    type: SnackBarType.success,
                  );
                  // Navigator.pushReplacement(
                  //   context,
                  //   CupertinoPageRoute(builder: (context) => DashboardScreen(token: state.token, role: '',)),
                  // );
                } else if (state is AuthError) {
                  CustomSnackBar.show(
                    context,
                    message: 'Login failed. Please check your ID and name.',
                    type: SnackBarType.error,
                  );
                }
              },
              builder: (context, state) {
                if (state is AuthLoading) {
                  return const Center(child: CircularProgressIndicator(color: Colors.greenAccent));
                }

                return Center(
                  child: ElevatedButton(
                    onPressed:
                        () => context.read<AuthCubit>().signIn(
                          _idController.text,
                          _nameController.text,
                        ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.greenAccent,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
                      padding: const EdgeInsets.symmetric(horizontal: 52, vertical: 12),
                    ),
                    child: const Text(
                      "Sign in",
                      style: TextStyle(
                        color: Color(0xFF181818),
                        fontSize: 17,
                        fontFamily: 'Projectfont',
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLabel(String text) {
    return Text(text, style: TextStyle(color: Colors.white, fontSize: 20.sp));
  }

  Widget _buildTextField(
    TextEditingController controller,
    String hintText, [
    TextInputType keyboardType = TextInputType.text,
  ]) {
    return TextField(
      controller: controller,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(color: Color(0xff9B9B9B)),
        enabledBorder: const UnderlineInputBorder(borderSide: BorderSide(color: Colors.white)),
        focusedBorder: const UnderlineInputBorder(borderSide: BorderSide(color: Colors.white)),
      ),
      style: const TextStyle(color: Colors.white),
    );
  }
}
