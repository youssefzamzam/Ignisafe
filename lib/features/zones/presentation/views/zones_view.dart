import 'package:flutter/material.dart';
import 'package:ignisafe/core/utils/app_colors.dart';
import 'package:ignisafe/features/zones/presentation/widgets/zones_view_body.dart';

class ZonesView extends StatelessWidget {
  const ZonesView({super.key});
  static const routeName = "Zones";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context); 
          },
          icon: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color:  const Color.fromARGB(215, 32, 28, 28),
            ),
            padding: EdgeInsets.all(8), 
            child: Icon(
              Icons.arrow_back_outlined,
              color: Colors.white, 
            ),
          ),
        ),
      ),
      body: SafeArea(child: ZonesViewBody()),
    );
  }
}
