import 'package:flutter/material.dart';

void main() {
  runApp(const GasLevelsApp());
}

class GasLevelsApp extends StatelessWidget {
  const GasLevelsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gas Levels Dashboard',
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF121212),
        fontFamily: 'Sans-serif',
        textTheme: const TextTheme(
          bodyMedium: TextStyle(color: Colors.white),
          bodySmall: TextStyle(color: Color(0xFF9CA3AF), fontSize: 12),
          labelSmall: TextStyle(color: Color(0xFF9CA3AF), fontSize: 10),
          titleMedium: TextStyle(color: Colors.white, fontSize: 18),
          titleSmall: TextStyle(color: Colors.white, fontSize: 14),
        ),
      ),
      home: const GasLevelsHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class GasLevelsHomePage extends StatefulWidget {
  const GasLevelsHomePage({super.key});

  @override
  State createState() => _GasLevelsHomePageState();
}

class _GasLevelsHomePageState extends State<GasLevelsHomePage> {
  final List<String> floors = ['Floor 1', 'Floor 2', 'Floor 3'];
  final List<String> halls = ['Hall 1', 'Hall 2'];

  final Map<String, Map<String, bool>> cameraOn = {};
  final Map<String, Map<String, bool>> notificationAlert = {};

  int _selectedBottomIndex = 1;

  @override
  void initState() {
    super.initState();
    for (var floor in floors) {
      cameraOn[floor] = {};
      notificationAlert[floor] = {};
      for (var hall in halls) {
        cameraOn[floor]![hall] = true;
        notificationAlert[floor]![hall] = true;
      }
    }
  }

  void toggleCamera(String floor, String hall) {
    setState(() {
      cameraOn[floor]![hall] = !(cameraOn[floor]![hall] ?? true);
    });
  }

  void toggleNotification(String floor, String hall) {
    setState(() {
      notificationAlert[floor]![hall] = !(notificationAlert[floor]![hall] ?? true);
    });
  }

  void onBottomNavTap(int index) {
    setState(() {
      _selectedBottomIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    const bgCard = Color(0xFF1E1E1E);
    const bgButton = Color(0xFF2E2E2E);
    const greenText = Color(0xFF4BD68A);
    const redDot = Color(0xFFE03E3E);
    const mintGreen = Color(0xFF7AF3D2);

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 24, 20, 100),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Back button
              SizedBox(
                width: 40,
                height: 40,
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: Color(0xFF3F3F3F)),
                    shape: const CircleBorder(),
                    padding: EdgeInsets.zero,
                    backgroundColor: Colors.transparent,
                  ),
                  onPressed: () {
                    // Implement back navigation if needed
                  },
                  child: const Icon(
                    Icons.arrow_back,
                    color: Color(0xFF9CA3AF),
                    size: 18,
                  ),
                ),
              ),
              const SizedBox(height: 24),
              Expanded(
                child: ListView.builder(
                  itemCount: floors.length,
                  itemBuilder: (context, floorIndex) {
                    final floor = floors[floorIndex];
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 32),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                floor,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              if (floorIndex == 0)
                                OutlinedButton(
                                  onPressed: () {
                                    // System Details action
                                  },
                                  style: OutlinedButton.styleFrom(
                                    side: const BorderSide(color: Color(0xFF3F3F3F)),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                                    minimumSize: Size.zero,
                                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                  ),
                                  child: const Text(
                                    'System Details',
                                    style: TextStyle(
                                      color: Color(0xFF6B6B6B),
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                            ],
                          ),
                          const SizedBox(height: 16),
                          SizedBox(
                            height: 180,
                            child: ListView.separated(
                              scrollDirection: Axis.horizontal,
                              itemCount: halls.length,
                              separatorBuilder: (_, __) => const SizedBox(width: 16),
                              itemBuilder: (context, hallIndex) {
                                final hall = halls[hallIndex];
                                final isCameraOn = cameraOn[floor]![hall]!;
                                final hasNotification = notificationAlert[floor]![hall]!;
                                return Container(
                                  width: 280,
                                  padding: const EdgeInsets.all(20),
                                  decoration: BoxDecoration(
                                    color: bgCard,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        hall,
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                      const SizedBox(height: 8),
                                      const Text(
                                        'Gas levels are within safe limits',
                                        style: TextStyle(
                                          color: Color(0xFF9CA3AF),
                                          fontSize: 12,
                                          height: 1.3,
                                        ),
                                      ),
                                      const Spacer(),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: const [
                                          Text(
                                            '3:00 PM',
                                            style: TextStyle(color: Color(0xFF6B6B6B), fontSize: 10),
                                          ),
                                          Text(
                                            '11-10-2024',
                                            style: TextStyle(color: Color(0xFF6B6B6B), fontSize: 10),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 12),
                                      Row(
                                        children: [
                                          // Camera button
                                          GestureDetector(
                                            onTap: () => toggleCamera(floor, hall),
                                            child: Container(
                                              width: 40,
                                              height: 40,
                                              decoration: const BoxDecoration(
                                                color: bgButton,
                                                shape: BoxShape.circle,
                                              ),
                                              child: Icon(
                                                Icons.videocam,
                                                color: isCameraOn ? const Color(0xFF9CA3AF) : const Color(0xFF4B4B4B),
                                                size: 18,
                                              ),
                                            ),
                                          ),
                                          const SizedBox(width: 12),
                                          // Gas quantity card
                                          Expanded(
                                            child: Container(
                                              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                                              decoration: BoxDecoration(
                                                color: bgButton,
                                                borderRadius: BorderRadius.circular(16),
                                              ),
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    children: [
                                                      const Text(
                                                        'Gas quantity',
                                                        style: TextStyle(
                                                          color: Color(0xFF9CA3AF),
                                                          fontSize: 10,
                                                        ),
                                                      ),
                                                      Image.network(
                                                        'https://storage.googleapis.com/a1aa/image/b0728893-ce6f-4a5f-e7f6-b0b7ecfbfd80.jpg',
                                                        width: 16,
                                                        height: 16,
                                                        color: const Color(0xFF9CA3AF),
                                                        colorBlendMode: BlendMode.modulate,
                                                        semanticLabel: 'Calendar icon',
                                                      ),
                                                    ],
                                                  ),
                                                  const SizedBox(height: 2),
                                                  const Text(
                                                    '4,500 liter',
                                                    style: TextStyle(
                                                      color: greenText,
                                                      fontSize: 12,
                                                      fontWeight: FontWeight.w600,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          const SizedBox(width: 12),
                                          // Notification button with red dot
                                          GestureDetector(
                                            onTap: () => toggleNotification(floor, hall),
                                            child: Stack(
                                              children: [
                                                Container(
                                                  width: 40,
                                                  height: 40,
                                                  decoration: const BoxDecoration(
                                                    color: bgButton,
                                                    shape: BoxShape.circle,
                                                  ),
                                                  child: Icon(
                                                    Icons.notifications,
                                                    color: hasNotification ? const Color(0xFF9CA3AF) : const Color(0xFF4B4B4B),
                                                    size: 18,
                                                  ),
                                                ),
                                                if (hasNotification)
                                                  const Positioned(
                                                    top: 6,
                                                    right: 6,
                                                    child: CircleAvatar(
                                                      radius: 4,
                                                      backgroundColor: redDot,
                                                    ),
                                                  ),
                                              ],
                                            ),
                                          ),
                                          const SizedBox(width: 12),
                                          // Temperature card
                                          Container(
                                            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                                            decoration: BoxDecoration(
                                              color: bgButton,
                                              borderRadius: BorderRadius.circular(16),
                                            ),
                                            child: Row(
                                              children: const [
                                                Icon(Icons.thermostat, color: Color(0xFF9CA3AF), size: 16),
                                                SizedBox(width: 6),
                                                Text(
                                                  '22 c',
                                                  style: TextStyle(
                                                    color: Color(0xFF9CA3AF),
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        margin: const EdgeInsets.only(bottom: 16),
        alignment: Alignment.center,
        child: Container(
          width: 320,
          height: 60,
          decoration: BoxDecoration(
            color: bgCard,
            borderRadius: BorderRadius.circular(40),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: Icon(Icons.grid_view, color: _selectedBottomIndex == 0 ? mintGreen : const Color(0xFF9CA3AF), size: 24),
                onPressed: () => onBottomNavTap(0),
                splashRadius: 24,
              ),
              GestureDetector(
                onTap: () => onBottomNavTap(1),
                child: Container(
                  width: 56,
                  height: 56,
                  decoration: BoxDecoration(
                    color: mintGreen,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: mintGreen.withOpacity(0.6),
                        blurRadius: 8,
                        spreadRadius: 1,
                      ),
                    ],
                  ),
                  child: const Icon(Icons.remove_red_eye, color: Colors.black, size: 28),
                ),
              ),
              IconButton(
                icon: Icon(Icons.settings, color: _selectedBottomIndex == 2 ? mintGreen : const Color(0xFF9CA3AF), size: 24),
                onPressed: () => onBottomNavTap(2),
                splashRadius: 24,
              ),
              IconButton(
                icon: Icon(Icons.list, color: _selectedBottomIndex == 3 ? mintGreen : const Color(0xFF9CA3AF), size: 24),
                onPressed: () => onBottomNavTap(3),
                splashRadius: 24,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
