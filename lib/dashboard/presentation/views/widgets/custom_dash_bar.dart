import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ignisafe/core/utils/app_colors.dart';

class CustomDashBar extends StatelessWidget {
  const CustomDashBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CircleAvatar(backgroundImage: AssetImage('assets/images/user.png'), radius: 24),
        Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              width: 45.w,
              height: 45.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24.r),
                border: Border.all(strokeAlign: 0.2, width: 0.5, color: Colors.white),
              ),
              child: GestureDetector(
                onTap: () {},
                child: Icon(Icons.notifications_outlined, color: Colors.white, size: 22.sp),
              ),
            ),
            Positioned(
              left: -2,
              child: Container(
                width: 12.w,
                height: 12.w,
                decoration: BoxDecoration(
                  color: AppColors.secondaryColor,
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.black, width: 1.5.w),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
