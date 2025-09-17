// ignore_for_file: use_build_context_synchronously

import 'package:eventify/global/snackbar.dart';
import 'package:eventify/screens/home_screen.dart';
import 'package:eventify/screens/login_screen.dart';
import 'package:eventify/services/auth_service.dart';
import 'package:eventify/widgets/colors.dart';
import 'package:eventify/widgets/custom_button.dart';
import 'package:eventify/widgets/custom_textfield.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool isobscureText = true;
  bool isLoading = false;
  String errorMessage = '';

  @override
  void dispose() {
    _usernameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _register() async {
    final username = _usernameController.text.trim();
    final email = _emailController.text.trim();
    final password = _passwordController.text.trim();

    try {
      setState(() {
        isLoading = true;
      });
      if (username.isEmpty || email.isEmpty || password.isEmpty) {
        setState(() {
          errorMessage = "Please fill in all fields.";
          isLoading = false;
        });
        return;
      }

      await authservice.value.signUp(
        email: email,
        password: password,
        name: username,
      );
      showFloatingSnackBar(
        context,
        backgroundColor: successColor,
        message: "Registration Successful",
      );
      Future.delayed(const Duration(seconds: 1), () async {
        await Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const HomeScreen()),
        );
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        showFloatingSnackBar(
          context,
          backgroundColor: errorColor,
          message: "The Email Address is Already in Use.",
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
        message: "Unexpected Error Occured",
      );
    }
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: whiteColor,
        appBar: AppBar(title: const Text("Register")),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: screenWidth * 0.06,
              vertical: screenHeight * 0.025,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: screenHeight * 0.1),
                Text(
                  "Create Account",
                  style: GoogleFonts.poppins(
                    color: blackColor,
                    fontSize: screenWidth * 0.07,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: screenHeight * 0.05),
                CustomTextfield(
                  hintText: "Enter your name",
                  labelText: "Name",
                  controller: _usernameController,
                  keyboardType: TextInputType.name,
                  prefixIcon: const Icon(Icons.person, color: blackColor),
                ),
                SizedBox(height: screenHeight * 0.03),
                CustomTextfield(
                  hintText: "Enter your email",
                  labelText: "Email",
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  prefixIcon: const Icon(Icons.email, color: blackColor),
                ),
                SizedBox(height: screenHeight * 0.03),
                CustomTextfield(
                  hintText: "Enter your password",
                  labelText: "Password",
                  controller: _passwordController,
                  keyboardType: TextInputType.visiblePassword,
                  obsecureText: isobscureText,
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        isobscureText = !isobscureText;
                      });
                    },
                    icon: Icon(
                      isobscureText ? Icons.visibility_off : Icons.visibility,
                      color: blackColor,
                    ),
                  ),
                ),
                if (errorMessage.isNotEmpty)
                  Center(
                    child: Padding(
                      padding: EdgeInsets.only(top: screenHeight * 0.03),
                      child: Text(
                        errorMessage,
                        style: GoogleFonts.poppins(color: Colors.red),
                      ),
                    ),
                  ),
                SizedBox(height: screenHeight * 0.08),
                isLoading
                    ? const Center(
                        child: CircularProgressIndicator(
                          color: primaryColor,
                          strokeWidth: 5,
                        ),
                      )
                    : CustomButton(
                        onPressed: () async => await _register(),
                        height: screenHeight * 0.07,
                        width: double.infinity,
                        buttonColor: primaryColor,
                        buttonText: 'Create Account',
                        buttonTextColor: whiteColor,
                        fontSize: screenWidth * 0.05,
                      ),
                SizedBox(height: screenHeight * 0.025),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have an account yet?",
                      style: GoogleFonts.poppins(
                        color: blackColor,
                        fontSize: screenWidth * 0.04,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const LoginScreen(),
                          ),
                        );
                      },
                      child: Text(
                        "Log In",
                        style: GoogleFonts.poppins(
                          color: primaryColor,
                          fontSize: screenWidth * 0.04,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
