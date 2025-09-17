// ignore_for_file: deprecated_member_use, use_build_context_synchronously

import 'package:eventify/global/snackbar.dart';
import 'package:eventify/model/event_model.dart';
import 'package:eventify/provider/favorite_provider.dart';
import 'package:eventify/widgets/colors.dart';
import 'package:eventify/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class EventDetailsScreen extends StatelessWidget {
  final EventModel event;
  const EventDetailsScreen({super.key, required this.event});

  String formatFullDate(String rawDate) {
    final DateTime parsedDate = DateTime.parse(rawDate);
    return DateFormat("d MMMM, y").format(parsedDate);
  }

  String formatDay(String rawDate) {
    final DateTime parsedDate = DateTime.parse(rawDate);
    return DateFormat("EEEE").format(parsedDate);
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final favoriteProvider = Provider.of<FavoriteProvider>(context);
    final isSaved = favoriteProvider.isFavorite(event);

    void registerEvent(BuildContext context) async {
      final box = Hive.box<EventModel>('registrations');
      if (!box.containsKey(event.id)) {
        await box.put(event.id, event);
        showFloatingSnackBar(
          context,
          message: "Event Registered!",
          backgroundColor: successColor,
        );
      } else {
        showFloatingSnackBar(
          context,
          message: "Already Registered!",
          backgroundColor: errorColor,
        );
      }
    }

    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        toolbarHeight: screenHeight * 0.12,
        iconTheme: IconThemeData(color: whiteColor, size: screenWidth * 0.075),
        title: Text(
          "Event Details",
          style: GoogleFonts.poppins(
            fontSize: screenWidth * 0.05,
            fontWeight: FontWeight.w600,
          ),
        ),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(35),
            bottomRight: Radius.circular(35),
          ),
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.only(
          left: screenWidth * 0.05,
          right: screenWidth * 0.05,
          top: screenHeight * 0.012,
          bottom: screenHeight * 0.050,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: screenHeight * 0.012),
            ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(35)),
              child: Stack(
                children: [
                  Image.asset(
                    event.imageUrl,
                    filterQuality: FilterQuality.medium,
                    width: double.infinity,
                  ),
                  Positioned(
                    top: screenHeight * 0.025,
                    right: screenWidth * 0.05,
                    child: GestureDetector(
                      onTap: () => favoriteProvider.toggleFavorite(event),
                      child: Container(
                        height: screenHeight * 0.055,
                        width: screenHeight * 0.055,
                        decoration: BoxDecoration(
                          color: whiteColor.withOpacity(0.3),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Icon(
                          isSaved ? Icons.bookmark : Icons.bookmark_outline,
                          color: whiteColor,
                          size: screenWidth * 0.06,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: screenHeight * 0.025),
            Text(
              event.title,
              style: GoogleFonts.poppins(
                fontSize: screenWidth * 0.09,
                fontWeight: FontWeight.bold,
                color: primaryTextColor,
              ),
              softWrap: true,
              overflow: TextOverflow.visible,
            ),
            SizedBox(height: screenHeight * 0.025),
            _buildTimeSection(screenWidth, screenHeight),
            SizedBox(height: screenHeight * 0.025),
            _buildLocationSection(screenWidth, screenHeight),
            SizedBox(height: screenHeight * 0.04),
            Text(
              "About Event",
              style: GoogleFonts.poppins(
                color: primaryTextColor,
                fontSize: screenWidth * 0.045,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: screenHeight * 0.012),
            Text(
              event.description,
              textAlign: TextAlign.start,
              style: GoogleFonts.poppins(
                color: blackColor,
                fontWeight: FontWeight.w400,
                fontSize: screenWidth * 0.037,
              ),
            ),
            SizedBox(height: screenHeight * 0.05),
            Center(
              child: CustomButton(
                height: screenHeight * 0.065,
                width: double.infinity,
                onPressed: () => registerEvent(context),
                buttonColor: primaryColor,
                buttonText: "Register",
                buttonTextColor: whiteColor,
                fontSize: screenWidth * 0.04,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTimeSection(double screenWidth, double screenHeight) {
    return Row(
      children: [
        Container(
          height: screenHeight * 0.065,
          width: screenHeight * 0.065,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: primaryColor.withOpacity(0.2),
          ),
          child: Icon(
            Icons.calendar_month,
            color: primaryColor,
            size: screenWidth * 0.06,
          ),
        ),
        SizedBox(width: screenWidth * 0.04),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              formatFullDate(event.date),
              style: GoogleFonts.poppins(
                color: primaryTextColor,
                fontWeight: FontWeight.w600,
                fontSize: screenWidth * 0.045,
              ),
            ),
            Text(
              "${formatDay(event.date)}, ${event.time}",
              style: GoogleFonts.poppins(
                color: secondaryTextColor,
                fontWeight: FontWeight.w500,
                fontSize: screenWidth * 0.037,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildLocationSection(double screenWidth, double screenHeight) {
    return Row(
      children: [
        Container(
          height: screenHeight * 0.065,
          width: screenHeight * 0.065,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: primaryColor.withOpacity(0.2),
          ),
          child: Icon(
            Icons.location_pin,
            color: primaryColor,
            size: screenWidth * 0.06,
          ),
        ),
        SizedBox(width: screenWidth * 0.04),
        Expanded(
          child: Text(
            event.location,
            style: GoogleFonts.poppins(
              color: primaryTextColor,
              fontWeight: FontWeight.w600,
              fontSize: screenWidth * 0.045,
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
