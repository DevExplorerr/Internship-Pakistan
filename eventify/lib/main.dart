// ignore_for_file: deprecated_member_use

import 'package:eventify/firebase_options.dart';
import 'package:eventify/model/event_model.dart';
import 'package:eventify/provider/favorite_provider.dart';
import 'package:eventify/screens/home_screen.dart';
import 'package:eventify/screens/splash_screen.dart';
import 'package:eventify/services/auth_service.dart';
import 'package:eventify/widgets/colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();

  // Register Adapter
  Hive.registerAdapter(EventModelAdapter());

  // Registration Box
  await Hive.openBox<EventModel>('registrations');

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => FavoriteProvider())],
      child: MaterialApp(
        title: "Eventify",
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          textSelectionTheme: TextSelectionThemeData(
            selectionColor: primaryColor.withOpacity(0.2),
            selectionHandleColor: blackColor,
            cursorColor: blackColor,
          ),
          textButtonTheme: TextButtonThemeData(
            style: ButtonStyle(
              overlayColor: WidgetStateProperty.all(
                blackColor.withOpacity(0.2),
              ),
            ),
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ButtonStyle(
              overlayColor: WidgetStateProperty.all(
                whiteColor.withOpacity(0.2),
              ),
            ),
          ),
          iconButtonTheme: IconButtonThemeData(
            style: ButtonStyle(
              overlayColor: WidgetStateProperty.all(
                blackColor.withOpacity(0.2),
              ),
            ),
          ),
          appBarTheme: AppBarTheme(
            elevation: 0,
            scrolledUnderElevation: 0,
            toolbarHeight: screenHeight * 0.12,
            backgroundColor: primaryColor,
            centerTitle: true,
            titleTextStyle: GoogleFonts.poppins(
              color: whiteColor,
              fontSize: 22,
              fontWeight: FontWeight.w600,
            ),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(35),
                bottomRight: Radius.circular(35),
              ),
            ),
          ),
        ),
        home: StreamBuilder<User?>(
          stream: authservice.value.authStateChanges,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(color: primaryColor),
              );
            } else if (snapshot.hasData) {
              return const HomeScreen();
            } else {
              return const SplashScreen();
            }
          },
        ),
      ),
    );
  }
}
