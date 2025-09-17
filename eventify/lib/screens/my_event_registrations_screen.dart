// ignore_for_file: use_build_context_synchronously

import 'package:eventify/global/snackbar.dart';
import 'package:eventify/model/event_model.dart';
import 'package:eventify/widgets/colors.dart';
import 'package:eventify/widgets/custom_confirmation_dialogbox.dart';
import 'package:eventify/widgets/my_event_card.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class MyEventRegistrationsScreen extends StatelessWidget {
  const MyEventRegistrationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final box = Hive.box<EventModel>('registrations');

    void deleteAll() async {
      await box.clear();
      showFloatingSnackBar(
        context,
        message: "All Events UnRegister Successfully",
        backgroundColor: successColor,
      );
      Future.delayed(const Duration(seconds: 1), () {
        Navigator.pop(context);
      });
    }

    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        iconTheme: IconThemeData(color: whiteColor, size: screenWidth * 0.075),
        title: const Text("My Events"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: whiteColor),
          onPressed: () => Navigator.pop(context),
        ),
        actionsPadding: const EdgeInsets.only(right: 10),
        actions: [
          GestureDetector(
            onTap: () {
              showDialog(
                context: context,
                barrierDismissible: true,
                animationStyle: const AnimationStyle(
                  curve: Curves.decelerate,
                  duration: Duration(milliseconds: 300),
                  reverseDuration: Duration(milliseconds: 200),
                ),
                builder: (context) => CustomConfirmationDialogbox(
                  title: "Are you sure you want to unregister all events?",
                  buttonText: "UnRegister",
                  onPressed: () {
                    deleteAll();
                  },
                ),
              );
            },
            child: const Icon(Icons.delete_forever),
          ),
        ],
      ),
      body: ValueListenableBuilder<Box<EventModel>>(
        valueListenable: box.listenable(),
        builder: (context, box, _) {
          final keys = box.keys.toList();

          if (keys.isEmpty) {
            return const Center(child: Text('No registered events yet'));
          }

          return ListView.builder(
            itemCount: keys.length,
            physics: const BouncingScrollPhysics(),
            padding: EdgeInsets.symmetric(vertical: screenHeight * 0.015),
            itemBuilder: (context, index) {
              final key = keys[index];
              final event = box.get(key);

              if (event == null) {
                return const SizedBox.shrink();
              }

              return MyEventCard(event: event, hiveKey: key);
            },
          );
        },
      ),
    );
  }
}
