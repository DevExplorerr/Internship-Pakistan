// ignore_for_file: use_build_context_synchronously

import 'package:eventify/global/snackbar.dart';
import 'package:eventify/screens/login_screen.dart';
import 'package:eventify/services/auth_service.dart';
import 'package:eventify/widgets/colors.dart';
import 'package:eventify/widgets/custom_button.dart';
import 'package:eventify/widgets/custom_confirmation_dialogbox.dart';
import 'package:eventify/widgets/custom_textfield.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DeleteAccountScreen extends StatefulWidget {
  const DeleteAccountScreen({super.key});

  @override
  State<DeleteAccountScreen> createState() => _DeleteAccountScreenState();
}

class _DeleteAccountScreenState extends State<DeleteAccountScreen>
    with SingleTickerProviderStateMixin {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool obsecureText = true;
  bool isLoading = false;
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;

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
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  Future<void> deleteAccount() async {
    try {
      setState(() {
        isLoading = true;
      });

      await authservice.value.deleteAccount(
        email: emailController.text,
        password: passwordController.text,
      );

      showFloatingSnackBar(
        context,
        backgroundColor: successColor,
        message: "Account Deleted Successfully",
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
        message: e.message.toString(),
      );
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;

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
              horizontal: media.width * 0.05,
              vertical: media.height * 0.012,
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: media.height * 0.03),
                  FadeTransition(
                    opacity: _fadeAnimation,
                    child: Icon(
                      Icons.delete_forever,
                      size: media.width * 0.18,
                      color: blackColor,
                    ),
                  ),
                  SizedBox(height: media.height * 0.025),
                  Text(
                    "Delete my account",
                    style: GoogleFonts.poppins(
                      color: blackColor,
                      fontSize: media.width * 0.07,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: media.height * 0.05),
                  CustomTextfield(
                    hintText: "Enter your email",
                    labelText: "Email",
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    prefixIcon: const Icon(Icons.email, color: blackColor),
                  ),
                  SizedBox(height: media.height * 0.03),
                  CustomTextfield(
                    hintText: 'Enter your password',
                    labelText: 'Password',
                    keyboardType: TextInputType.visiblePassword,
                    obsecureText: obsecureText,
                    controller: passwordController,
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          obsecureText = !obsecureText;
                        });
                      },
                      icon: Icon(
                        obsecureText ? Icons.visibility_off : Icons.visibility,
                        color: blackColor,
                      ),
                    ),
                  ),
                  SizedBox(height: media.height * 0.045),
                  isLoading
                      ? const Center(
                          child: CircularProgressIndicator(
                            color: primaryColor,
                            strokeWidth: 5,
                          ),
                        )
                      : CustomButton(
                          onPressed: () {
                            showDialog(
                              context: context,
                              barrierDismissible: true,
                              animationStyle: const AnimationStyle(
                                curve: Curves.decelerate,
                                duration: Duration(milliseconds: 300),
                                reverseDuration: Duration(milliseconds: 200),
                              ),
                              builder: (context) => CustomConfirmationDialogbox(
                                title:
                                    "Delete Account? This action can't be undone",
                                buttonText: "Delete",
                                onPressed: () async {
                                  await deleteAccount();
                                },
                              ),
                            );
                          },
                          height: media.height * 0.07,
                          width: double.infinity,
                          fontSize: media.width * 0.055,
                          buttonColor: primaryColor,
                          buttonText: 'Delete Permanently',
                          buttonTextColor: whiteColor,
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
