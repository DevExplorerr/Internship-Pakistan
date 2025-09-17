// ignore_for_file: deprecated_member_use

import 'package:eventify/model/event_model.dart';
import 'package:eventify/widgets/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qr_flutter/qr_flutter.dart';

class TicketScreen extends StatelessWidget {
  final EventModel event;
  const TicketScreen({super.key, required this.event});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        iconTheme: IconThemeData(color: whiteColor, size: screenWidth * 0.075),
        title: Text("My Event Ticket"),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(
          horizontal: screenWidth * 0.05,
          vertical: screenHeight * 0.05,
        ),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                event.title,
                style: GoogleFonts.poppins(
                  fontSize: screenWidth * 0.06,
                  fontWeight: FontWeight.bold,
                  color: primaryTextColor,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: screenHeight * 0.012),
              Text(
                "${event.date} • ${event.time}",
                style: GoogleFonts.poppins(
                  color: primaryTextColor,
                  fontWeight: FontWeight.w600,
                  fontSize: screenWidth * 0.04,
                ),
              ),
              SizedBox(height: screenHeight * 0.012),
              Text(
                event.location,
                style: GoogleFonts.poppins(
                  color: secondaryTextColor,
                  fontWeight: FontWeight.w600,
                  fontSize: screenWidth * 0.038,
                ),
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: screenHeight * 0.025),
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  event.imageUrl,
                  height: screenHeight * 0.23,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  filterQuality: FilterQuality.medium,
                ),
              ),
              SizedBox(height: screenHeight * 0.04),
              Container(
                padding: EdgeInsets.all(screenWidth * 0.04),
                decoration: BoxDecoration(
                  color: whiteColor,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: blackColor.withOpacity(0.2),
                      blurRadius: 10,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                child: QrImageView(
                  data:
                      "${event.id}|${event.title}|${event.date}|${event.location}",
                  version: QrVersions.auto,
                  size: screenWidth * 0.5,
                  eyeStyle: const QrEyeStyle(
                    eyeShape: QrEyeShape.circle,
                    color: blackColor,
                  ),
                  dataModuleStyle: const QrDataModuleStyle(
                    dataModuleShape: QrDataModuleShape.circle,
                    color: blackColor,
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.025),
              Text(
                "Scan this QR at the event entrance",
                style: GoogleFonts.poppins(
                  fontSize: screenWidth * 0.035,
                  color: primaryTextColor,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
