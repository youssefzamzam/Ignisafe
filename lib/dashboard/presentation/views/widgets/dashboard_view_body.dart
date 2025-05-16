import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ignisafe/dashboard/presentation/views/widgets/custom_dash_bar.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

// class DashboardViewBody extends StatelessWidget {
//   const DashboardViewBody({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
//           child: Column(
//             children: [
//               CustomDashBar(),
//                SizedBox(height: 32.h),

//             // Overall Performance Gauge
//             Container(
//               padding: EdgeInsets.all(32.w),
//               decoration: BoxDecoration(
//                 color: Colors.grey.shade900,
//                 borderRadius: BorderRadius.circular(24),
//               ),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   SizedBox(
//                     width: 200.w,
//                     height: 200.w,
//                     child: SfRadialGauge(
//                       axes: <RadialAxis>[
//                         RadialAxis(
//                           minimum: 0,
//                           maximum: 100,
//                           showLabels: false,
//                           showTicks: false,
//                           axisLineStyle: AxisLineStyle(
//                             thickness: 0.15,
//                             thicknessUnit: GaugeSizeUnit.factor,
//                             color: Colors.grey.shade700,
//                           ),
//                           pointers: <GaugePointer>[
//                             RangePointer(
//                               value: 65,
//                               cornerStyle: CornerStyle.bothCurve,
//                               width: 0.15,
//                               sizeUnit: GaugeSizeUnit.factor,
//                               gradient: SweepGradient(
//                                 colors: [Colors.greenAccent, Colors.green],
//                               ),
//                             ),
//                           ],
//                           annotations: <GaugeAnnotation>[
//                             GaugeAnnotation(
//                               widget: Column(
//                                 mainAxisSize: MainAxisSize.min,
//                                 children: [
//                                   Text(
//                                     "Overall Performance",
//                                     style: TextStyle(
//                                       color: Colors.white,
//                                       fontSize: 18.sp,
//                                     ),
//                                   ),
//                                   Text(
//                                     "65%",
//                                     style: TextStyle(
//                                       color: Colors.white,
//                                       fontSize: 40.sp,
//                                       fontWeight: FontWeight.bold,
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                               positionFactor: 0.1,
//                               angle: 90,
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Text(
//                         "0",
//                         style: TextStyle(color: Colors.grey.shade600, fontSize: 16.sp),
//                       ),
//                       Text(
//                         "100",
//                         style: TextStyle(color: Colors.grey.shade600, fontSize: 16.sp),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//             SizedBox(height: 24.h),

//             // Gasometer and Temp Cards
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 _buildInfoCard("Gasometer", "4,500 m²", Colors.greenAccent),
//                 _buildInfoCard("Temp", "34 C / 93.2 F", Colors.greenAccent, subtitle: "Normal"),
//               ],
//             ),
//             SizedBox(height: 24.h),

//             // Emergency Button
//             Container(
//               width: double.infinity,
//               padding: EdgeInsets.symmetric(vertical: 16.h),
//               decoration: BoxDecoration(
//                 color: Colors.red,
//                 borderRadius: BorderRadius.circular(12),
//               ),
//               alignment: Alignment.center,
//               child: Text(
//                 "Emergency Gas Shutdown",
//                 style: TextStyle(
//                   color: Colors.white,
//                   fontSize: 20.sp,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     ),);
//   }

//   Widget _buildInfoCard(String title, String value, Color valueColor, {String? subtitle}) {
//     return Container(
//       width: 160.w,
//       height: 120.h,
//       padding: EdgeInsets.all(16.w),
//       decoration: BoxDecoration(
//         color: Colors.grey.shade900,
//         borderRadius: BorderRadius.circular(20),
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Align(
//             alignment: Alignment.topRight,
//             child: Icon(Icons.info_outline, color: Colors.white54, size: 20.sp),
//           ),
//           Text(title, style: TextStyle(color: Colors.white, fontSize: 18.sp)),
//           SizedBox(height: 8.h),
//           Text(
//             value,
//             style: TextStyle(color: valueColor, fontSize: 20.sp, fontWeight: FontWeight.bold),
//           ),
//           if (subtitle != null)
//             Align(
//               alignment: Alignment.bottomRight,
//               child: Text(subtitle, style: TextStyle(color: Colors.white54, fontSize: 14.sp)),
//             ),
//         ],
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DashboardViewBody extends StatelessWidget {
  const DashboardViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
          child: Column(
            children: [
              _buildPerformanceGauge(),
              SizedBox(height: 16.h),

              // Gasometer and Temp Cards
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [_buildGasometerCard(), _buildTemperatureCard()],
              ),
              SizedBox(height: 16.h),

              // Emergency Button
              _buildEmergencyButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPerformanceGauge() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: const Color(0xFF1E1E1E),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          SizedBox(height: 24.h),
          Stack(
            alignment: Alignment.center,
            children: [
              // Background circle
              Container(
                width: 200.w,
                height: 200.w,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.black.withOpacity(0.3),
                ),
              ),

              // Gray circle track
              Container(
                width: 180.w,
                height: 180.w,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.grey.shade800, width: 8.w),
                ),
              ),

              // White progress indicator (arc)
              CustomPaint(
                size: Size(180.w, 180.w),
                painter: ArcPainter(sweepAngle: 230, color: Colors.white, strokeWidth: 8.w),
              ),

              // Green dots around the circle
              ...List.generate(21, (index) {
                final angle = -150 + (index * 15);
                final isActive = index < 14;

                return Positioned(
                  child: Transform.rotate(
                    angle: angle * 3.14159 / 180,
                    child: Transform.translate(
                      offset: Offset(0, -105.w),
                      child: Container(
                        width: 6.w,
                        height: 6.w,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: isActive ? const Color(0xFF4ECCA3) : Colors.grey.shade700,
                        ),
                      ),
                    ),
                  ),
                );
              }),

              // Center text
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Overall Performance",
                    style: TextStyle(color: Colors.white, fontSize: 16.sp),
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    "65%",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 36.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 16.h),

          // Min and Max values
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("0", style: TextStyle(color: Colors.grey.shade600, fontSize: 14.sp)),
                Text("100", style: TextStyle(color: Colors.grey.shade600, fontSize: 14.sp)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGasometerCard() {
    return Container(
      width: 164.w,
      height: 120.h,
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: const Color(0xFF1E1E1E),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Gasometer",
                style: TextStyle(color: Colors.white, fontSize: 16.sp, fontWeight: FontWeight.w500),
              ),
              Icon(Icons.layers, color: Colors.white54, size: 20.sp),
            ],
          ),
          Spacer(),
          Text(
            "4,500 m²",
            style: TextStyle(
              color: const Color(0xFF4ECCA3),
              fontSize: 18.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTemperatureCard() {
    return Container(
      width: 164.w,
      height: 120.h,
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: const Color(0xFF1E1E1E),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Temp",
                style: TextStyle(color: Colors.white, fontSize: 16.sp, fontWeight: FontWeight.w500),
              ),
              Icon(Icons.thermostat, color: Colors.white54, size: 20.sp),
            ],
          ),
          Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                "34 C / 93.2 F",
                style: TextStyle(
                  color: const Color(0xFF4ECCA3),
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text("Normal", style: TextStyle(color: Colors.white54, fontSize: 12.sp)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildEmergencyButton() {
    return Container(
      width: double.infinity,
      height: 64.h,
      decoration: BoxDecoration(color: Colors.red, borderRadius: BorderRadius.circular(16)),
      child: Center(
        child: Text(
          "Emergency Gas Shutdown",
          style: TextStyle(color: Colors.white, fontSize: 18.sp, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}

// Custom painter for the arc
class ArcPainter extends CustomPainter {
  final double sweepAngle;
  final Color color;
  final double strokeWidth;

  ArcPainter({required this.sweepAngle, required this.color, required this.strokeWidth});

  @override
  void paint(Canvas canvas, Size size) {
    final rect = Rect.fromCircle(
      center: Offset(size.width / 2, size.height / 2),
      radius: size.width / 2,
    );

    final paint =
        Paint()
          ..color = color
          ..style = PaintingStyle.stroke
          ..strokeWidth = strokeWidth
          ..strokeCap = StrokeCap.round;

    canvas.drawArc(rect, -150 * 3.14159 / 180, sweepAngle * 3.14159 / 180, false, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}






// class DashboardViewBody extends StatelessWidget {
//   const DashboardViewBody({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black,
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
//           child: Column(
//             children: [
//               CustomDashBar(),
//               SizedBox(height: 16.h),

//               // Overall Performance Gauge
//               _buildPerformanceGauge(),
//               SizedBox(height: 16.h),

//               // Gasometer and Temp Cards
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [_buildGasometerCard(), _buildTemperatureCard()],
//               ),
//               SizedBox(height: 16.h),

//               // Emergency Button
//               _buildEmergencyButton(),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildPerformanceGauge() {
//     return Container(
//       width: double.infinity,
//       padding: EdgeInsets.all(16.w),
//       decoration: BoxDecoration(
//         color: const Color(0xFF1E1E1E),
//         borderRadius: BorderRadius.circular(20),
//       ),
//       child: Column(
//         children: [
//           SizedBox(height: 24.h),
//           Stack(
//             alignment: Alignment.center,
//             children: [
//               // Background circle
//               Container(
//                 width: 200.w,
//                 height: 200.w,
//                 decoration: BoxDecoration(
//                   shape: BoxShape.circle,
//                   color: Colors.black.withOpacity(0.3),
//                 ),
//               ),

//               // Gray circle track
//               Container(
//                 width: 180.w,
//                 height: 180.w,
//                 decoration: BoxDecoration(
//                   shape: BoxShape.circle,
//                   border: Border.all(color: Colors.grey.shade800, width: 8.w),
//                 ),
//               ),

//               // White progress indicator (arc)
//               CustomPaint(
//                 size: Size(180.w, 180.w),
//                 painter: ArcPainter(sweepAngle: 230, color: Colors.white, strokeWidth: 8.w),
//               ),

//               // Green dots around the circle
//               ...List.generate(
//                 21, // Number of dots
//                 (index) {
//                   // Calculate angle for each dot (0 to 300 degrees)
//                   final angle = -150 + (index * 15);
//                   final isActive = index < 14; // First 13 dots are active (65%)

//                   return Positioned(
//                     child: Transform.rotate(
//                       angle: angle * 3.14159 / 180, // Convert to radians
//                       child: Transform.translate(
//                         offset: Offset(0, -105.w), // Position on circle
//                         child: Container(
//                           width: 6.w,
//                           height: 6.w,
//                           decoration: BoxDecoration(
//                             shape: BoxShape.circle,
//                             color: isActive ? const Color(0xFF4ECCA3) : Colors.grey.shade700,
//                           ),
//                         ),
//                       ),
//                     ),
//                   );
//                 },
//               ),

//               // Center text
//               Column(
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   Text(
//                     "Overall Performance",
//                     style: TextStyle(color: Colors.white, fontSize: 16.sp),
//                   ),
//                   SizedBox(height: 8.h),
//                   Text(
//                     "65%",
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontSize: 36.sp,
//                       fontWeight: FontWeight.w500,
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//           SizedBox(height: 16.h),

//           // Min and Max values
//           Padding(
//             padding: EdgeInsets.symmetric(horizontal: 16.w),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Text("0", style: TextStyle(color: Colors.grey.shade600, fontSize: 14.sp)),
//                 Text("100", style: TextStyle(color: Colors.grey.shade600, fontSize: 14.sp)),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildGasometerCard() {
//     return Container(
//       width: 164.w,
//       height: 120.h,
//       padding: EdgeInsets.all(16.w),
//       decoration: BoxDecoration(
//         color: const Color(0xFF1E1E1E),
//         borderRadius: BorderRadius.circular(20),
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Text(
//                 "Gasometer",
//                 style: TextStyle(color: Colors.white, fontSize: 16.sp, fontWeight: FontWeight.w500),
//               ),
//               Icon(
//                 Icons.layers, // Use a square/box icon to match design
//                 color: Colors.white54,
//                 size: 20.sp,
//               ),
//             ],
//           ),
//           Spacer(),
//           Text(
//             "4,500 m²",
//             style: TextStyle(
//               color: const Color(0xFF4ECCA3),
//               fontSize: 18.sp,
//               fontWeight: FontWeight.w500,
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildTemperatureCard() {
//     return Container(
//       width: 164.w,
//       height: 120.h,
//       padding: EdgeInsets.all(16.w),
//       decoration: BoxDecoration(
//         color: const Color(0xFF1E1E1E),
//         borderRadius: BorderRadius.circular(20),
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Text(
//                 "Temp",
//                 style: TextStyle(color: Colors.white, fontSize: 16.sp, fontWeight: FontWeight.w500),
//               ),
//               Icon(
//                 Icons.thermostat, // Thermometer icon
//                 color: Colors.white54,
//                 size: 20.sp,
//               ),
//             ],
//           ),
//           Spacer(),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             crossAxisAlignment: CrossAxisAlignment.end,
//             children: [
//               Text(
//                 "34 C / 93.2 F",
//                 style: TextStyle(
//                   color: const Color(0xFF4ECCA3),
//                   fontSize: 16.sp,
//                   fontWeight: FontWeight.w500,
//                 ),
//               ),
//               Text("Normal", style: TextStyle(color: Colors.white54, fontSize: 12.sp)),
//             ],
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildEmergencyButton() {
//     return Container(
//       width: double.infinity,
//       height: 64.h,
//       decoration: BoxDecoration(color: Colors.red, borderRadius: BorderRadius.circular(16)),
//       child: Center(
//         child: Text(
//           "Emergency Gas Shutdown",
//           style: TextStyle(color: Colors.white, fontSize: 18.sp, fontWeight: FontWeight.w500),
//         ),
//       ),
//     );
//   }
// }

// // Custom painter for the arc
// class ArcPainter extends CustomPainter {
//   final double sweepAngle;
//   final Color color;
//   final double strokeWidth;

//   ArcPainter({required this.sweepAngle, required this.color, required this.strokeWidth});

//   @override
//   void paint(Canvas canvas, Size size) {
//     final rect = Rect.fromCircle(
//       center: Offset(size.width / 2, size.height / 2),
//       radius: size.width / 2,
//     );

//     final paint =
//         Paint()
//           ..color = color
//           ..style = PaintingStyle.stroke
//           ..strokeWidth = strokeWidth
//           ..strokeCap = StrokeCap.round;

//     // Start from -150 degrees (top-left), sweep clockwise
//     canvas.drawArc(
//       rect,
//       -150 * 3.14159 / 180, // Start angle in radians
//       sweepAngle * 3.14159 / 180, // Sweep angle in radians
//       false,
//       paint,
//     );
//   }

//   @override
//   bool shouldRepaint(CustomPainter oldDelegate) => true;
// }
