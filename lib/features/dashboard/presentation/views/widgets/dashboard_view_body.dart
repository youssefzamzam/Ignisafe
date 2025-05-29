import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DashboardViewBody extends StatelessWidget {
  const DashboardViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final theme = Theme.of(context);

    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleAvatar(radius: 20, backgroundImage: AssetImage('assets/user.png')),
                Stack(
                  children: [
                    CircleAvatar(
                      backgroundColor: theme.cardColor,
                      child: const Icon(Icons.notifications_outlined, size: 24),
                    ),
                    Positioned(
                      top: 1.5,
                      left: 1,
                      child: Container(
                        width: 8,
                        height: 8,
                        decoration: const BoxDecoration(shape: BoxShape.circle, color: Colors.red),
                      ),
                    ),
                  ],
                ),
              ],
            ),

            const SizedBox(height: 24),

            // Gauge
            Container(
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: 4.w, vertical: 8.h),
              decoration: BoxDecoration(
                gradient: RadialGradient(
                  colors: [
                    Color(0xFF2C2C2C),
                    Color(0xFF2C2C2C),
                    Color(0xFF2C2C2C),
                    Color(0xFF2C2C2C),
                    Color(0xFF2C2C2C),
                    Color(0xFF2C2C2C),
                    Color(0xFF3E3E3E),
                    Color(0xFF3E3E3E),
                    Color(0xFF3E3E3E), //
                  ],
                ),
                borderRadius: BorderRadius.circular(16.r),
              ),
              padding: const EdgeInsets.all(24),
              child: Column(
                children: [
                  SizedBox(
                    height: 250.h,
                    width: 270.w,
                    child: CustomPaint(
                      painter: GaugePainter(percentage: 0.65, isDark: isDark),
                      child: Center(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'Overall Performance',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(height: 8.h),
                            Text(
                              '65%',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 24.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 16.h),

            // Cards
            Row(
              children: [
                _InfoCard(
                  title: 'Gasometer',
                  value: '4,500',
                  unit: 'm²',
                  icon: Icons.grid_view,
                  theme: theme,
                ),
                SizedBox(width: 16.w),
                _TempCard(theme: theme),
              ],
            ),

            SizedBox(height: 32.h),

            // Emergency Button
            SizedBox(
              width: 275.w,
              height: 110.h,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32.r)),
                ),
                child: Text(
                  'Emergency Gas Shutdown',
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _InfoCard extends StatelessWidget {
  final String title;
  final String value;
  final String unit;
  final IconData icon;
  final ThemeData theme;

  const _InfoCard({
    required this.title,
    required this.value,
    required this.unit,
    required this.icon,
    required this.theme,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = theme.brightness == Brightness.dark;

    return Expanded(
      child: Container(
        height: 160.h,
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: isDark ? Color(0xFF2C2C2C) : Colors.grey.shade300,
          borderRadius: BorderRadius.circular(18.r),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.topRight,
              child: CircleAvatar(
                backgroundColor: isDark ? Colors.grey.shade800 : Colors.white,
                radius: 14.r,
                child: Icon(icon, size: 24.sp, color: Colors.grey.shade600),
              ),
            ),
            const Spacer(),
            Text(title, style: theme.textTheme.headlineSmall),
            Row(
              children: [
                Text(
                  value,
                  style: TextStyle(
                    fontSize: 22.sp,
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(' $unit', style: TextStyle(fontSize: 22.sp, color: Colors.green)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _TempCard extends StatelessWidget {
  final ThemeData theme;

  const _TempCard({required this.theme});

  @override
  Widget build(BuildContext context) {
    final isDark = theme.brightness == Brightness.dark;

    return Expanded(
      child: Container(
        height: 160.h,
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: isDark ? Color(0xFF2C2C2C) : Colors.grey.shade300,
          borderRadius: BorderRadius.circular(18.r),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.topRight,
              child: CircleAvatar(
                backgroundColor: isDark ? Colors.grey.shade800 : Colors.white,
                radius: 14.r,
                child: Icon(Icons.thermostat_outlined, size: 24.sp, color: Colors.grey.shade600),
              ),
            ),
            const Spacer(),
            Text('Temp', style: theme.textTheme.headlineSmall),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('34°C / 93.2°F', style: TextStyle(color: Colors.green, fontSize: 14.sp)),
                Text('Normal', style: TextStyle(color: Colors.white, fontSize: 14.sp)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class GaugePainter extends CustomPainter {
  final double percentage;
  final bool isDark;
  GaugePainter({required this.percentage, required this.isDark});

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2 - 20;

    final dotRadius = 4.0;
    final totalDots = 30;
    final anglePerDot = 2 * math.pi / totalDots;

    final dotPaint = Paint()..style = PaintingStyle.fill;
    for (int i = 0; i < totalDots; i++) {
      final angle = -math.pi / 2 + i * anglePerDot;
      final dotCenter = Offset(
        center.dx + (radius + 20) * math.cos(angle),
        center.dy + (radius + 20) * math.sin(angle),
      );
      dotPaint.color =
          i <= (percentage * totalDots)
              ? Colors.greenAccent
              : (isDark ? Colors.grey.shade700 : Colors.grey.shade400);
      canvas.drawCircle(dotCenter, dotRadius, dotPaint);
    }

    final arcPaint =
        Paint()
          ..color = Colors.white
          ..style = PaintingStyle.stroke
          ..strokeWidth = 6
          ..strokeCap = StrokeCap.round;

    final rect = Rect.fromCircle(center: center, radius: radius - 10);
    canvas.drawArc(rect, -math.pi / 2, 2 * math.pi * percentage, false, arcPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
