import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const GasPerformanceApp());
}

class GasPerformanceApp extends StatelessWidget {
  const GasPerformanceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gas Performance Dashboard',
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF1A1A1A),
        fontFamily: 'RobotoMono',
        textTheme: const TextTheme(
          bodyMedium: TextStyle(color: Colors.white),
          bodySmall: TextStyle(color: Color(0xFF6B7280)),
          labelSmall: TextStyle(
              color: Color(0xFF4ADE80),
              fontFamily: 'RobotoMono'),
          titleMedium: TextStyle(
              color: Colors.white,
              fontSize: 16),
          titleSmall: TextStyle(
              color: Color(0xFF4ADE80),
              fontFamily: 'RobotoMono',
              fontSize: 14),
          labelMedium: TextStyle(
              color: Color(0xFF6B7280),
              fontSize: 12),
        ),
      ),
      home: const GasPerformanceHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class GasPerformanceHomePage extends StatefulWidget {
  const GasPerformanceHomePage({super.key});

  @override
  State<GasPerformanceHomePage> createState() => _GasPerformanceHomePageState();
}

class _GasPerformanceHomePageState extends State<GasPerformanceHomePage> {
  int _selectedIndex = 0;

  void _onNavBarTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _showEmergencyDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: const Color(0xFF2A2A2A),
        title: const Text(
          'Emergency Gas Shutdown',
          style: TextStyle(color: Colors.white, fontFamily: 'RobotoMono'),
        ),
        content: const Text(
          'Are you sure you want to perform an emergency gas shutdown?',
          style: TextStyle(color: Colors.white70),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cancel', style: TextStyle(color: Color(0xFF4ADE80))),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red[600],
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            ),
            onPressed: () {
              Navigator.of(context).pop();
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Emergency Gas Shutdown Activated!',
                      style: TextStyle(fontFamily: 'RobotoMono')),
                  backgroundColor: Colors.red,
                ),
              );
            },
            child: const Text('Confirm', style: TextStyle(fontFamily: 'RobotoMono')),
          ),
        ],
      ),
    );
  }

  Widget _buildPerformanceGauge() {
    return SizedBox(
      width: 240,
      height: 240,
      child: CustomPaint(
        painter: GaugePainter(percentage: 65),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: const [
              Text(
                'Overall Performance',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.white,
                  fontFamily: 'RobotoMono',
                ),
              ),
              SizedBox(height: 6),
              Text(
                '65%',
                style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                  fontFamily: 'RobotoMono',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInfoCard({
    required String title,
    required String mainValue,
    String? subValue,
    String? status,
    required VoidCallback onSettingsTap,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF2A2A2A),
        borderRadius: BorderRadius.circular(24),
      ),
      padding: const EdgeInsets.all(16),
      child: Stack(
        children: [
          Positioned(
            right: 8,
            top: 8,
            child: InkWell(
              onTap: onSettingsTap,
              borderRadius: BorderRadius.circular(20),
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: const Color(0xFF3A3A3A),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Icon(
                  Icons.settings,
                  color: Color(0xFF6B7280),
                  size: 20,
                ),
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: const TextStyle(fontSize: 16, color: Colors.white)),
              const SizedBox(height: 6),
              Text(mainValue, style: const TextStyle(
                fontSize: 14,
                color: Color(0xFF4ADE80),
                fontFamily: 'RobotoMono',
              )),
              if (subValue != null) Text(subValue, style: const TextStyle(
                fontSize: 14,
                color: Color(0xFF4ADE80),
                fontFamily: 'RobotoMono',
              )),
              if (status != null) Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Text(
                  status,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Color(0xFF6B7280),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildBottomNavBar() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: const Color(0xFF2A2A2A),
        borderRadius: BorderRadius.circular(36),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(153),
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _NavBarItem(
            icon: Icons.grid_view,
            isSelected: _selectedIndex == 0,
            selectedColor: const Color(0xFF4ADE80),
            onTap: () => _onNavBarTap(0),
            ariaLabel: 'Dashboard',
          ),
          _NavBarItem(
            icon: Icons.remove_red_eye,
            isSelected: _selectedIndex == 1,
            selectedColor: const Color(0xFF4ADE80),
            onTap: () => _onNavBarTap(1),
            ariaLabel: 'Visibility',
          ),
          _NavBarItem(
            icon: Icons.group,
            isSelected: _selectedIndex == 2,
            selectedColor: const Color(0xFF4ADE80),
            onTap: () => _onNavBarTap(2),
            ariaLabel: 'Users',
          ),
          _NavBarItem(
            icon: Icons.list,
            isSelected: _selectedIndex == 3,
            selectedColor: const Color(0xFF4ADE80),
            onTap: () => _onNavBarTap(3),
            ariaLabel: 'Menu',
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Column(
            children: [
              // Top bar with avatar and notification bell
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Avatar
                  ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Image.network(
                      'https://storage.googleapis.com/a1aa/image/d66fb291-80b7-47ef-2275-9a5508ce7298.jpg',
                      width: 40,
                      height: 40,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) => Container(
                        width: 40,
                        height: 40,
                        color: Colors.grey,
                        child: const Icon(Icons.person, color: Colors.white),
                      ),
                    ),
                  ),
                  // Notification bell with red dot
                  Stack(
                    children: [
                      IconButton(
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('No new notifications',
                                  style: TextStyle(fontFamily: 'RobotoMono')),
                            ),
                          );
                        },
                        icon: const Icon(Icons.notifications, size: 24),
                        color: Colors.white,
                        tooltip: 'Notifications',
                      ),
                      Positioned(
                        right: 12,
                        top: 12,
                        child: Container(
                          width: 8,
                          height: 8,
                          decoration: BoxDecoration(
                            color: Colors.red[600],
                            shape: BoxShape.circle,
                            border: Border.all(
                                color: const Color(0xFF1A1A1A),
                                width: 1.5),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 16),
              // Performance gauge card
              Container(
                decoration: BoxDecoration(
                  color: const Color(0xFF2A2A2A),
                  borderRadius: BorderRadius.circular(24),
                ),
                padding: const EdgeInsets.all(24),
                child: Column(
                  children: [
                    _buildPerformanceGauge(),
                    const SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text('0', style: TextStyle(color: Color(0xFF4B5563), fontSize: 12)),
                        Text('100', style: TextStyle(color: Color(0xFF4B5563), fontSize: 12)),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              // Info cards row
              Row(
                children: [
                  Expanded(
                    child: _buildInfoCard(
                      title: 'Gasometer',
                      mainValue: '4,500 m²',
                      onSettingsTap: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Gasometer settings tapped',
                                style: TextStyle(fontFamily: 'RobotoMono')),
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: _buildInfoCard(
                      title: 'Temp',
                      mainValue: '34 C / 93.2 F',
                      status: 'Normal',
                      onSettingsTap: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Temperature settings tapped',
                                style: TextStyle(fontFamily: 'RobotoMono')),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              // Emergency button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _showEmergencyDialog,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red[600],
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                    textStyle: const TextStyle(
                        fontFamily: 'RobotoMono',
                        fontSize: 14),
                  ),
                  child: const Text('Emergency Gas Shutdown'),
                ),
              ),
              const Spacer(),
              // Bottom navigation bar
              _buildBottomNavBar(),
            ],
          ),
        ),
      ),
    );
  }
}

class _NavBarItem extends StatelessWidget {
  final IconData icon;
  final bool isSelected;
  final Color selectedColor;
  final VoidCallback onTap;
  final String ariaLabel;

  const _NavBarItem({
    required this.icon,
    required this.isSelected,
    required this.selectedColor,
    required this.onTap,
    required this.ariaLabel,
  });

  @override
  Widget build(BuildContext context) {
    final color = isSelected ? Colors.black : const Color(0xFF6B7280);
    final bgColor = isSelected ? selectedColor : Colors.transparent;

    return Semantics(
      label: ariaLabel,
      selected: isSelected,
      button: true,
      child: InkWell(
        borderRadius: BorderRadius.circular(100),
        onTap: onTap,
        child: Container(
          width: 48,
          height: 48,
          decoration: BoxDecoration(
            color: bgColor,
            borderRadius: BorderRadius.circular(100),
          ),
          child: Icon(icon, color: color, size: 20),
        ),
      ),
    );
  }
}

class GaugePainter extends CustomPainter {
  final double percentage;

  GaugePainter({required this.percentage});

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2 - 12;

    // Draw base circles (dots) every 12 degrees from -90 to 258 degrees (30 dots)
    for (int i = 0; i < 30; i++) {
      final angle = (-90 + i * 12) * 3.1415926535897932 / 180;
      final dotPaint = Paint()
        ..color = i < (percentage / 100 * 30).floor()
            ? const Color(0xFF4ADE80)
            : const Color(0xFF4B5563).withAlpha((0.3 * 255).round())
        ..style = PaintingStyle.fill;

      final dotRadius = 4.5;
      final dotX = center.dx + (radius) * cos(angle);
      final dotY = center.dy + (radius) * sin(angle);

      canvas.drawCircle(Offset(dotX, dotY), dotRadius, dotPaint);
    }

    // Draw inner white arc ring for progress (65%)
    final arcRadius = radius - 14;
    final arcRect = Rect.fromCircle(center: center, radius: arcRadius);
    final startAngle = -3.1415926535897932 / 2;
    final sweepAngle = 2 * 3.1415926535897932 * (percentage / 100);

    final whiteArcPaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    canvas.drawArc(arcRect, startAngle, sweepAngle, false, whiteArcPaint);

    // Draw inner arc background (remaining)
    final remainingArcPaint = Paint()
      ..color = Colors.white.withAlpha(25)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    canvas.drawArc(
        arcRect,
        startAngle + sweepAngle,
        2 * 3.1415926535897932 - sweepAngle,
        false,
        remainingArcPaint
    );
  }

  @override
  bool shouldRepaint(covariant GaugePainter oldDelegate) {
    return oldDelegate.percentage != percentage;
  }
}