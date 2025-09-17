// ignore_for_file: deprecated_member_use

import 'package:eventify/data/dummy_events.dart';
import 'package:eventify/model/event_model.dart';
import 'package:eventify/widgets/colors.dart';
import 'package:eventify/widgets/home_drawer.dart';
import 'package:eventify/widgets/home_event_card.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeContent extends StatefulWidget {
  final void Function(int) onSeeAllTap;
  const HomeContent({super.key, required this.onSeeAllTap});
  @override
  State<HomeContent> createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> {
  final List<EventModel> events = dummyEvents;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        iconTheme: IconThemeData(color: whiteColor, size: screenWidth * 0.075),
        title: Text("Eventify"),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_none, color: whiteColor),
            onPressed: () {},
          ),
        ],
      ),
      drawer: const HomeDrawer(),
      drawerEnableOpenDragGesture: true,
      drawerEdgeDragWidth: screenWidth * 0.3,
      drawerScrimColor: blackColor.withOpacity(0.2),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.only(
          top: screenHeight * 0.025,
          bottom: screenHeight * 0.02,
        ),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Upcoming Events",
                    style: GoogleFonts.poppins(
                      color: primaryTextColor,
                      fontSize: screenWidth * 0.045,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      widget.onSeeAllTap(2);
                    },

                    child: Text(
                      "See All >",
                      style: GoogleFonts.poppins(
                        color: secondaryTextColor,
                        fontSize: screenWidth * 0.037,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: screenHeight * 0.02),
            ListView.builder(
              itemCount: 5,
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return HomeEventCard(event: events[index]);
              },
            ),
            SizedBox(height: screenHeight * 0.01),
            _buildInviteCard(context),
          ],
        ),
      ),
    );
  }

  Widget _buildInviteCard(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Container(
      margin: EdgeInsets.all(screenWidth * 0.04),
      decoration: BoxDecoration(
        color: const Color(0xFF00F8FF).withOpacity(0.16),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Padding(
            padding: EdgeInsets.only(
              top: screenHeight * 0.018,
              left: screenWidth * 0.045,
              bottom: screenHeight * 0.018,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Invite your friends",
                  style: GoogleFonts.poppins(
                    fontSize: screenWidth * 0.045,
                    fontWeight: FontWeight.w600,
                    color: primaryTextColor,
                  ),
                ),
                SizedBox(height: screenHeight * 0.005),
                Text(
                  "Get \$20 for ticket",
                  style: GoogleFonts.poppins(
                    fontSize: screenWidth * 0.037,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xff484D70),
                  ),
                ),
                SizedBox(height: screenHeight * 0.015),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF00F8FF),
                    padding: EdgeInsets.symmetric(
                      horizontal: screenWidth * 0.06,
                      vertical: screenHeight * 0.012,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  onPressed: () {},
                  child: Text(
                    "INVITE",
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w500,
                      fontSize: screenWidth * 0.037,
                      color: whiteColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Image.asset(
              "assets/images/gift.png",
              height: screenHeight * 0.15,
              fit: BoxFit.contain,
              filterQuality: FilterQuality.medium,
            ),
          ),
        ],
      ),
    );
  }
}
