// ignore_for_file: use_build_context_synchronously, deprecated_member_use

import 'package:eventify/global/snackbar.dart';
import 'package:eventify/model/event_model.dart';
import 'package:eventify/provider/favorite_provider.dart';
import 'package:eventify/screens/event_details_screen.dart';
import 'package:eventify/screens/ticket_screen.dart';
import 'package:eventify/widgets/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:hive/hive.dart';

class MyEventCard extends StatelessWidget {
  final EventModel event;
  final dynamic hiveKey;
  const MyEventCard({super.key, required this.event, required this.hiveKey});

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

              PopupMenuButton<String>(
                color: whiteColor,
                elevation: 10,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                icon: const Icon(Icons.more_vert, color: blackColor),
                onSelected: (value) async {
                  if (value == 'ticket') {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => TicketScreen(event: event),
                      ),
                    );
                  } else if (value == 'unregister') {
                    final box = Hive.box<EventModel>('registrations');
                    box.delete(hiveKey);
                    showFloatingSnackBar(
                      context,
                      message: "Event Unregistered",
                      backgroundColor: successColor,
                    );
                  } else if (value == 'bookmark') {
                    favoriteProvider.toggleFavorite(event);
                    showFloatingSnackBar(
                      context,
                      message: favoriteProvider.isFavorite(event)
                          ? "Added to Favorites"
                          : "Removed from Favorites",
                      backgroundColor: successColor,
                    );
                  }
                },
                itemBuilder: (context) {
                  final fontSize = screenWidth * 0.035;
                  final iconSize = screenWidth * 0.045;

                  return [
                    PopupMenuItem(
                      value: 'ticket',
                      child: Row(
                        children: [
                          Icon(
                            Icons.qr_code,
                            size: iconSize,
                            color: primaryColor,
                          ),
                          SizedBox(width: screenWidth * 0.02),
                          Text(
                            'View Ticket',
                            style: GoogleFonts.poppins(
                              fontSize: fontSize,
                              color: primaryTextColor,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                    PopupMenuItem(
                      value: 'bookmark',
                      child: Row(
                        children: [
                          Icon(
                            isSaved ? Icons.bookmark_outline : Icons.bookmark,
                            size: iconSize,
                            color: primaryColor,
                          ),
                          SizedBox(width: screenWidth * 0.02),
                          Text(
                            isSaved ? 'Remove Favorite' :'Save as Favorite' ,
                            style: GoogleFonts.poppins(
                              fontSize: fontSize,
                              color: primaryTextColor,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                    PopupMenuItem(
                      value: 'unregister',
                      child: Row(
                        children: [
                          Icon(
                            Icons.event_busy,
                            size: iconSize,
                            color: primaryColor,
                          ),
                          SizedBox(width: screenWidth * 0.02),
                          Text(
                            'UnRegister',
                            style: GoogleFonts.poppins(
                              fontSize: fontSize,
                              color: primaryTextColor,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ];
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
