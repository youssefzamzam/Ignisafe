import 'package:flutter/material.dart';

class ZonesViewBody extends StatelessWidget {
  const ZonesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: OutlinedButton(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.white,
                side: const BorderSide(color: Colors.white),
              ),
              child: const Text("System Details"),
            ),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          FloorSection(floorName: 'Floor 1'),
          SizedBox(height: 24),
          FloorSection(floorName: 'Floor 2'),
        ],
      ),
    );
  }
}

class FloorSection extends StatelessWidget {
  final String floorName;

  const FloorSection({super.key, required this.floorName});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(floorName, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        const SizedBox(height: 12),
        SizedBox(
          height: 200,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: 3,
            separatorBuilder: (_, __) => const SizedBox(width: 16),
            itemBuilder: (_, index) => const HallCard(),
          ),
        ),
      ],
    );
  }
}

class HallCard extends StatelessWidget {
  const HallCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 260,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF1E1E1E),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Hall 1', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          const Text('Gas levels are within safe limits', style: TextStyle(fontSize: 14)),
          const Spacer(),
          Row(
            children: const [
              Icon(Icons.access_time, size: 16, color: Colors.grey),
              SizedBox(width: 4),
              Text('3:00 PM', style: TextStyle(fontSize: 12, color: Colors.grey)),
              Spacer(),
              Text('11-10-2024', style: TextStyle(fontSize: 12, color: Colors.grey)),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              _IconCircle(icon: Icons.videocam, label: 'On', backgroundColor: Colors.grey.shade800),
              const SizedBox(width: 8),
              _InfoBox(
                icon: Icons.calendar_today,
                title: 'Gas quantity',
                value: '4,500 liter',
                valueColor: Colors.greenAccent,
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Stack(
                clipBehavior: Clip.none,
                children: [
                  const _IconCircle(icon: Icons.notifications_none),
                  Positioned(
                    top: -2,
                    right: -2,
                    child: Container(
                      width: 10,
                      height: 10,
                      decoration: const BoxDecoration(color: Colors.red, shape: BoxShape.circle),
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 8),
              const _InfoBox(icon: Icons.thermostat_outlined, title: '', value: '22 c'),
            ],
          ),
        ],
      ),
    );
  }
}

class _IconCircle extends StatelessWidget {
  final IconData icon;
  final String? label;
  final Color? backgroundColor;

  const _IconCircle({required this.icon, this.label, this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 20,
          backgroundColor: backgroundColor ?? Colors.grey.shade900,
          child: Icon(icon, size: 20, color: Colors.white),
        ),
        if (label != null) ...[
          const SizedBox(height: 4),
          Text(label!, style: const TextStyle(fontSize: 12)),
        ],
      ],
    );
  }
}

class _InfoBox extends StatelessWidget {
  final IconData icon;
  final String title;
  final String value;
  final Color? valueColor;

  const _InfoBox({required this.icon, required this.title, required this.value, this.valueColor});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.grey.shade900,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Icon(icon, size: 16, color: Colors.white),
            const SizedBox(width: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (title.isNotEmpty)
                  Text(title, style: const TextStyle(fontSize: 12, color: Colors.white)),
                Text(value, style: TextStyle(fontSize: 12, color: valueColor ?? Colors.white)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
