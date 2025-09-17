// ignore_for_file: deprecated_member_use

import 'package:eventify/model/event_model.dart';
import 'package:eventify/provider/favorite_provider.dart';
import 'package:eventify/screens/event_details_screen.dart';
import 'package:eventify/widgets/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class FavoriteCard extends StatelessWidget {
  final EventModel event;
  const FavoriteCard({super.key, required this.event});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final favoriteProvider = Provider.of<FavoriteProvider>(context);
    final isSaved = favoriteProvider.isFavorite(event);
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: screenWidth * 0.04,
        vertical: screenHeight * 0.012,
      ),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => EventDetailsScreen(event: event)),
          );
        },
        child: Container(
          height: screenHeight * 0.14,
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.025),
          decoration: BoxDecoration(
            color: whiteColor,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: const Color(0xff535990).withOpacity(0.07),
                offset: const Offset(0, 8),
                blurRadius: 25,
                spreadRadius: 0,
              ),
            ],
          ),

          child: Row(
            children: [
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15.0),
                    child: Image.asset(
                      event.imageUrl,
                      height: screenHeight * 0.12,
                      width: screenWidth * 0.25,
                      filterQuality: FilterQuality.medium,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    top: screenHeight * 0.015,
                    right: screenWidth * 0.025,
                    child: GestureDetector(
                      onTap: () => favoriteProvider.toggleFavorite(event),
                      child: Container(
                        height: screenWidth * 0.09,
                        width: screenWidth * 0.09,
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
              SizedBox(width: screenWidth * 0.04),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '${event.date} - ${event.time}',
                      style: GoogleFonts.poppins(
                        color: primaryColor,
                        fontSize: screenWidth * 0.038,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.006),
                    Text(
                      event.title,
                      style: GoogleFonts.poppins(
                        color: blackColor,
                        fontSize: screenWidth * 0.048,
                        fontWeight: FontWeight.w600,
                      ),
                      softWrap: true,
                      overflow: TextOverflow.visible,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
