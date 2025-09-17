// ignore_for_file: deprecated_member_use

import 'package:eventify/data/dummy_events.dart';
import 'package:eventify/model/event_model.dart';
import 'package:eventify/widgets/custom_textfield.dart';
import 'package:eventify/widgets/home_drawer.dart';
import 'package:eventify/widgets/search_event_card.dart';
import 'package:eventify/widgets/colors.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});
  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List<EventModel> filteredEvents = [];
  final TextEditingController _searchQueryController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    void filterEvents(String query) {
      if (query.isEmpty) {
        setState(() {
          filteredEvents = [];
        });
      } else {
        setState(() {
          filteredEvents = dummyEvents.where((event) {
            final titleMatch = event.title.toLowerCase().contains(
              query.toLowerCase(),
            );
            final descriptionMatch = event.description.toLowerCase().contains(
              query.toLowerCase(),
            );
            final dateMatch = event.date.toLowerCase().contains(
              query.toLowerCase(),
            );
            final locationMatch = event.location.toLowerCase().contains(
              query.toLowerCase(),
            );
            return titleMatch || descriptionMatch || dateMatch || locationMatch;
          }).toList();
        });
      }
    }

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: whiteColor,
        appBar: AppBar(
          iconTheme: IconThemeData(
            color: whiteColor,
            size: screenWidth * 0.075,
          ),
          title: const Text("Search"),
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
        body: Column(
          children: [
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: CustomTextfield(
                hintText: "Tech Event...",
                labelText: "Search",
                controller: _searchQueryController,
                prefixIcon: Icon(Icons.search),
                suffixIcon: IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.filter_alt),
                ),
                onChanged: filterEvents,
              ),
            ),
            Expanded(
              child: _searchQueryController.text.isEmpty
                  ? const Center(child: Text("Start typing to search..."))
                  : filteredEvents.isEmpty
                  ? const Center(child: Text("No events found"))
                  : ListView.builder(
                      itemCount: filteredEvents.isNotEmpty
                          ? filteredEvents.length
                          : 0,
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (context, index) {
                        return SearchEventCard(event: filteredEvents[index]);
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
