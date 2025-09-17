// ignore_for_file: deprecated_member_use

import 'package:eventify/model/event_model.dart';
import 'package:eventify/provider/favorite_provider.dart';
import 'package:eventify/screens/event_details_screen.dart';
import 'package:eventify/widgets/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class HomeEventCard extends StatelessWidget {
  final EventModel event;
  const HomeEventCard({super.key, required this.event});

  String formatEventDateVertical(String rawDate) {
    final DateTime parsedDate = DateTime.parse(rawDate);
    final day = DateFormat("d").format(parsedDate);
    final month = DateFormat("MMM").format(parsedDate);
    return "$day\n$month";
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
          vertical: screenHeight * 0.012,
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
            borderRadius: BorderRadius.circular(18),
            boxShadow: [
              BoxShadow(
                color: const Color(0xff505588).withOpacity(0.06),
                offset: const Offset(0, 8),
                blurRadius: 30,
                spreadRadius: 0,
              ),
            ],
          ),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    child: Image.asset(
                      event.imageUrl,
                      height: screenHeight * 0.20,
                      width: double.infinity,
                      filterQuality: FilterQuality.medium,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: screenWidth * 0.028,
                      vertical: screenHeight * 0.015,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: screenHeight * 0.065,
                          width: screenWidth * 0.13,
                          decoration: BoxDecoration(
                            color: whiteColor.withOpacity(0.3),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: Text(
                              formatEventDateVertical(event.date),
                              textAlign: TextAlign.center,
                              style: GoogleFonts.poppins(
                                fontWeight: FontWeight.bold,
                                fontSize: screenWidth * 0.035,
                                color: whiteColor,
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () => favoriteProvider.toggleFavorite(event),
                          child: Container(
                            height: screenHeight * 0.052,
                            width: screenWidth * 0.11,
                            decoration: BoxDecoration(
                              color: whiteColor.withOpacity(0.3),
                              borderRadius: BorderRadius.circular(7),
                            ),
                            child: Icon(
                              color: whiteColor,
                              isSaved ? Icons.bookmark : Icons.bookmark_outline,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: screenHeight * 0.012),
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
                    color: primaryColor,
                    size: screenWidth * 0.045,
                  ),
                  SizedBox(width: screenWidth * 0.012),
                  Expanded(
                    child: Text(
                      event.location,
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600,
                        fontSize: screenWidth * 0.032,
                        color: primaryColor,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
              SizedBox(height: screenHeight * 0.006),
              Text(
                event.description,
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w500,
                  fontSize: screenWidth * 0.037,
                  color: secondaryTextColor,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
