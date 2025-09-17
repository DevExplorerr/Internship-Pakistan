// ignore_for_file: deprecated_member_use

import 'package:eventify/data/dummy_events.dart';
import 'package:eventify/model/event_model.dart';
import 'package:eventify/widgets/all_event_card.dart';
import 'package:eventify/widgets/colors.dart';
import 'package:eventify/widgets/home_drawer.dart';
import 'package:flutter/material.dart';

class AllEventsScreen extends StatefulWidget {
  const AllEventsScreen({super.key});
  @override
  State<AllEventsScreen> createState() => _AllEventsScreenState();
}

class _AllEventsScreenState extends State<AllEventsScreen> {
  final List<EventModel> allEvents = dummyEvents;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        iconTheme: IconThemeData(color: whiteColor, size: screenWidth * 0.075),
        title: const Text("Events"),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_none, color: whiteColor),
            onPressed: () {},
          ),
        ],
      ),
      drawer: const HomeDrawer(),
      drawerEnableOpenDragGesture: true,
      drawerEdgeDragWidth: 120,
      drawerScrimColor: blackColor.withOpacity(0.2),
      body: ListView.builder(
        itemCount: allEvents.length,
        padding: EdgeInsets.only(top: screenHeight * 0.015),
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          return AllEventCard(event: allEvents[index]);
        },
      ),
    );
  }
}
