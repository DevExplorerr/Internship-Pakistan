// ignore_for_file: use_build_context_synchronously

import 'package:eventify/global/snackbar.dart';
import 'package:eventify/screens/login_screen.dart';
import 'package:eventify/services/auth_service.dart';
import 'package:eventify/widgets/colors.dart';
import 'package:eventify/widgets/custom_button.dart';
import 'package:eventify/widgets/custom_textfield.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});
  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen>
    with SingleTickerProviderStateMixin {
  final TextEditingController _emailController = TextEditingController();
  bool isLoading = false;
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  String errorMessage = "";

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    _fadeAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    );
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    _emailController.dispose();
    super.dispose();
  }

  Future<void> resetPassword() async {
    try {
      setState(() => isLoading = true);

      if (_emailController.text.trim().isEmpty) {
        setState(() {
          errorMessage = "Please Enter Email";
          isLoading = false;
        });
        return;
      }

      await authservice.value.resetPassword(email: _emailController.text);
      showFloatingSnackBar(
        context,
        backgroundColor: successColor,
        message: "Reset Link Sent Please Check Your Email",
      );

      Future.delayed(const Duration(seconds: 1), () async {
        await Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (_) => const LoginScreen()),
          (route) => false,
        );
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        showFloatingSnackBar(
          context,
          backgroundColor: errorColor,
          message: "Invalid Email",
        );
      } else {
        showFloatingSnackBar(
          context,
          backgroundColor: errorColor,
          message: "Error: ${e.code}",
        );
      }
    } catch (_) {
      showFloatingSnackBar(
        context,
        backgroundColor: errorColor,
        message: "Unexpected Error Occurred.",
      );
    }

    setState(() => isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: whiteColor,
        appBar: AppBar(
          leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.arrow_back, color: whiteColor),
          ),
        ),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: width * 0.05,
              vertical: height * 0.015,
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: height * 0.1),
                  FadeTransition(
                    opacity: _fadeAnimation,
                    child: Icon(
                      Icons.lock_outline,
                      size: width * 0.2,
                      color: blackColor,
                    ),
                  ),
                  SizedBox(height: height * 0.03),
                  Text(
                    "Reset Password",
                    style: GoogleFonts.poppins(
                      color: blackColor,
                      fontSize: width * 0.07,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: height * 0.015),
                  Text(
                    "Enter your email to receive a reset link",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      color: blackColor,
                      fontSize: width * 0.035,
                    ),
                  ),
                  SizedBox(height: height * 0.05),
                  CustomTextfield(
                    hintText: "Enter your email",
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    prefixIcon: const Icon(Icons.email, color: blackColor),
                    labelText: 'Email',
                  ),
                  if (errorMessage.isNotEmpty)
                    Padding(
                      padding: EdgeInsets.only(top: height * 0.025),
                      child: Text(
                        errorMessage,
                        style: GoogleFonts.poppins(
                          color: Colors.red,
                          fontSize: width * 0.035,
                        ),
                      ),
                    ),
                  SizedBox(height: height * 0.05),
                  isLoading
                      ? const Center(
                          child: CircularProgressIndicator(color: primaryColor),
                        )
                      : CustomButton(
                          buttonColor: primaryColor,
                          buttonText: "Reset Password",
                          buttonTextColor: whiteColor,
                          height: height * 0.07,
                          width: double.infinity,
                          fontSize: width * 0.05,
                          onPressed: () async {
                            await resetPassword();
                          },
                        ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
