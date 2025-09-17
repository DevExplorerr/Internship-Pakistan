// ignore_for_file: deprecated_member_use

import 'package:eventify/model/event_model.dart';
import 'package:eventify/provider/favorite_provider.dart';
import 'package:eventify/widgets/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../screens/event_details_screen.dart';

class AllEventCard extends StatelessWidget {
  final EventModel event;
  const AllEventCard({super.key, required this.event});

  String formatEventDate(String rawDate) {
    final DateTime parsedDate = DateTime.parse(rawDate);
    final day = DateFormat("EEE").format(parsedDate);
    final date = DateFormat("MMM d").format(parsedDate);
    return "$day, $date";
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final favoriteProvider = Provider.of<FavoriteProvider>(context);
    final isSaved = favoriteProvider.isFavorite(event);

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => EventDetailsScreen(event: event)),
        );
      },
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: screenWidth * 0.06,
          vertical: screenHeight * 0.015,
        ),
        child: Container(
          height: screenHeight * 0.34,
          width: double.infinity,
          padding: EdgeInsets.only(
            right: screenWidth * 0.022,
            left: screenWidth * 0.022,
            top: screenHeight * 0.011,
          ),
          decoration: BoxDecoration(
            color: whiteColor,
            borderRadius: BorderRadius.circular(screenWidth * 0.04),
            boxShadow: [
              BoxShadow(
                color: const Color(0xff575C8A).withOpacity(0.06),
                offset: Offset(0, screenHeight * 0.012),
                blurRadius: screenWidth * 0.09,
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.all(
                      Radius.circular(screenWidth * 0.025),
                    ),
                    child: Image.asset(
                      event.imageUrl,
                      height: screenHeight * 0.20,
                      width: double.infinity,
                      filterQuality: FilterQuality.medium,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    top: screenHeight * 0.015,
                    right: screenWidth * 0.03,
                    child: GestureDetector(
                      onTap: () => favoriteProvider.toggleFavorite(event),
                      child: Container(
                        height: screenHeight * 0.052,
                        width: screenWidth * 0.11,
                        decoration: BoxDecoration(
                          color: whiteColor.withOpacity(0.3),
                          borderRadius: BorderRadius.circular(
                            screenWidth * 0.018,
                          ),
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
              SizedBox(height: screenHeight * 0.014),
              Text(
                "${formatEventDate(event.date)} • ${event.time}",
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w500,
                  fontSize: screenWidth * 0.035,
                  color: primaryColor,
                ),
              ),
              SizedBox(height: screenHeight * 0.006),
              Text(
                event.title,
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w600,
                  fontSize: screenWidth * 0.045,
                  color: primaryTextColor,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(height: screenHeight * 0.006),
              Row(
                children: [
                  Icon(
                    Icons.location_on,
                    color: secondaryTextColor,
                    size: screenWidth * 0.045,
                  ),
                  SizedBox(width: screenWidth * 0.012),
                  Expanded(
                    child: Text(
                      event.location,
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w500,
                        fontSize: screenWidth * 0.033,
                        color: secondaryTextColor,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
