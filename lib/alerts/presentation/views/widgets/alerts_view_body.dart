import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:ignisafe/core/utils/app_colors.dart';

class AlertsViewBody extends StatelessWidget {
  const AlertsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.darkGreyTxtColor,
        centerTitle: true,
        title: Text("Alerts", style: TextStyle(color: Colors.white)),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context); // or any custom action
          },
          icon: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.black, // or your preferred color
            ),
            padding: EdgeInsets.all(8), // adjust for size
            child: Icon(
              Icons.arrow_back,
              color: Colors.white, // arrow color
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          InkWell(
            borderRadius: BorderRadius.circular(16), // match card's border radius
            onTap: () {
              log("Card tapped!");
            },
            child: Card(
              color: Color(0xFF1E1E1E),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "False Alarm",
                          style: TextStyle(
                            color: Colors.greenAccent,
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          "Floor 1 - Hall 2",
                          style: TextStyle(color: Colors.grey[400], fontSize: 14),
                        ),
                      ],
                    ),
                    Text("3:00 AM", style: TextStyle(color: Colors.grey[400], fontSize: 14)),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
