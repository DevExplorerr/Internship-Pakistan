import 'package:flutter/material.dart';
import 'package:my_first_flutter_app/colors.dart'; // Make sure bgColor and primaryColor are defined here

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 45),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 30),

            // Profile Avatar with subtitle
            Center(
              child: Column(
                children: [
                  CircleAvatar(
                    backgroundColor: primaryColor,
                    maxRadius: 50,
                    child:
                        const Icon(Icons.person, color: Colors.white, size: 50),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    "Flutter Intern",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.grey[700],
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 40),

            // Profile Info Card
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 8,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  profileInfo("Name", "Saad Jamal"),
                  const SizedBox(height: 15),
                  profileInfo("Email", "saadj4775@gmail.com"),
                  const SizedBox(height: 15),
                  profileInfo("Location", "Karachi, Pakistan"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Helper widget for profile info
  Widget profileInfo(String title, String value) {
    return RichText(
      text: TextSpan(
        style: const TextStyle(fontSize: 18, color: Colors.black),
        children: [
          TextSpan(
            text: "$title: ",
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          TextSpan(text: value),
        ],
      ),
    );
  }
}
