// ignore_for_file: use_build_context_synchronously

import 'package:eventify/global/snackbar.dart';
import 'package:eventify/screens/delete_account_screen.dart';
import 'package:eventify/screens/favorite_event_screen.dart';
import 'package:eventify/screens/login_screen.dart';
import 'package:eventify/screens/my_event_registrations_screen.dart';
import 'package:eventify/services/auth_service.dart';
import 'package:eventify/widgets/colors.dart';
import 'package:eventify/widgets/custom_button.dart';
import 'package:eventify/widgets/custom_confirmation_dialogbox.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeDrawer extends StatefulWidget {
  const HomeDrawer({super.key});
  @override
  State<HomeDrawer> createState() => _HomeDrawerState();
}

class _HomeDrawerState extends State<HomeDrawer> {
  final User? currentUser = authservice.value.currentUser;

  void signOut() async {
    try {
      await authservice.value.signOut();
      showFloatingSnackBar(
        context,
        backgroundColor: successColor,
        message: "Logged Out Successfully",
      );
      Navigator.pop(context);
      Future.delayed(const Duration(seconds: 1), () async {
        await Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (_) => const LoginScreen()),
          (route) => false,
        );
      });
    } on FirebaseAuthException catch (e) {
      showFloatingSnackBar(
        context,
        backgroundColor: errorColor,
        message: "Error: ${e.message}",
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final nameFontSize = screenWidth * 0.045;
    final emailFontSize = screenWidth * 0.035;
    final drawerItemFontSize = screenWidth * 0.04;
    final iconSize = screenWidth * 0.065;
    final avatarSize = screenWidth * 0.1;
    final buttonHeight = screenWidth * 0.12;
    final buttonFontSize = screenWidth * 0.04;

    return Drawer(
      backgroundColor: whiteColor,
      elevation: 8,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.horizontal(right: Radius.circular(24)),
      ),
      child: Column(
        children: [
          UserAccountsDrawerHeader(
            decoration: const BoxDecoration(
              color: whiteColor,
              borderRadius: BorderRadius.only(topRight: Radius.circular(24)),
            ),
            accountName: Text(
              currentUser?.displayName ?? "Guest User",
              style: GoogleFonts.poppins(
                fontSize: nameFontSize,
                fontWeight: FontWeight.bold,
                color: blackColor,
              ),
            ),
            accountEmail: Text(
              currentUser?.email ?? "No Email",
              style: GoogleFonts.poppins(
                fontSize: emailFontSize,
                color: blackColor,
              ),
            ),
            currentAccountPicture: CircleAvatar(
              radius: avatarSize,
              backgroundColor: primaryColor,
              child: Icon(Icons.person, size: avatarSize, color: whiteColor),
            ),
          ),

          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(vertical: 8),
              children: [
                _buildDrawerItem(
                  icon: Icons.home,
                  text: "Home",
                  fontSize: drawerItemFontSize,
                  iconSize: iconSize,
                  onTap: () => Navigator.pop(context),
                ),
                _buildDrawerItem(
                  icon: Icons.event,
                  text: "My Events",
                  fontSize: drawerItemFontSize,
                  iconSize: iconSize,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const MyEventRegistrationsScreen(),
                      ),
                    );
                  },
                ),
                _buildDrawerItem(
                  icon: Icons.bookmark_outline,
                  text: "Favorite Events",
                  fontSize: drawerItemFontSize,
                  iconSize: iconSize,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const FavoriteEventScreen(),
                      ),
                    );
                  },
                ),
                _buildDrawerItem(
                  icon: Icons.delete_forever,
                  text: "Delete My Account",
                  fontSize: drawerItemFontSize,
                  iconSize: iconSize,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const DeleteAccountScreen(),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),

          Padding(
            padding: EdgeInsets.only(
              left: screenWidth * 0.04,
              right: screenWidth * 0.04,
              top: screenWidth * 0.04,
              bottom: screenWidth * 0.08,
            ),
            child: CustomButton(
              height: buttonHeight,
              width: double.infinity,
              fontSize: buttonFontSize,
              buttonColor: primaryColor,
              buttonText: "Logout",
              buttonTextColor: whiteColor,
              onPressed: () {
                showDialog(
                  context: context,
                  barrierDismissible: true,
                  animationStyle: AnimationStyle(
                    curve: Curves.decelerate,
                    duration: const Duration(milliseconds: 300),
                    reverseDuration: const Duration(milliseconds: 200),
                  ),
                  builder: (context) => CustomConfirmationDialogbox(
                    title: "Are you sure you want to logout?",
                    buttonText: "Logout",
                    onPressed: () {
                      signOut();
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDrawerItem({
    required IconData icon,
    required String text,
    required VoidCallback onTap,
    required double fontSize,
    required double iconSize,
  }) {
    return ListTile(
      leading: Icon(icon, color: primaryColor, size: iconSize),
      title: Text(
        text,
        style: GoogleFonts.poppins(
          fontSize: fontSize,
          fontWeight: FontWeight.w500,
          color: blackColor,
        ),
      ),
      onTap: onTap,
    );
  }
}
