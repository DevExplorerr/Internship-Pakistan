// ignore_for_file: use_build_context_synchronously

import 'package:eventify/global/snackbar.dart';
import 'package:eventify/screens/home_screen.dart';
import 'package:eventify/screens/reset_password_screen.dart';
import 'package:eventify/screens/signup_screen.dart';
import 'package:eventify/services/auth_service.dart';
import 'package:eventify/widgets/colors.dart';
import 'package:eventify/widgets/custom_button.dart';
import 'package:eventify/widgets/custom_textfield.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool isobscureText = true;
  bool isLoading = false;
  String errorMessage = '';

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _login() async {
    try {
      setState(() => isLoading = true);

      if (_emailController.text.trim().isEmpty ||
          _passwordController.text.trim().isEmpty) {
        setState(() {
          errorMessage = "Please enter email and password";
          isLoading = false;
        });
        return;
      }

      await authservice.value.signIn(
        email: _emailController.text,
        password: _passwordController.text,
      );

      showFloatingSnackBar(
        context,
        backgroundColor: successColor,
        message: "Login Successfully",
      );

      Future.delayed(const Duration(seconds: 1), () async {
        await Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const HomeScreen()),
        );
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found' || e.code == 'wrong-password') {
        showFloatingSnackBar(
          context,
          backgroundColor: errorColor,
          message: "Invalid Email or Password",
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
        message: "Unexpected Error Occurred",
      );
    }

    setState(() => isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;
    final width = media.width;
    final height = media.height;

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: whiteColor,
        appBar: AppBar(title: const Text("Login")),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: width * 0.06,
              vertical: height * 0.02,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: height * 0.12),
                Text(
                  "Welcome Back",
                  style: GoogleFonts.poppins(
                    color: blackColor,
                    fontSize: width * 0.065,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: height * 0.05),
                CustomTextfield(
                  hintText: "Enter your email",
                  labelText: "Email",
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  prefixIcon: const Icon(Icons.email, color: blackColor),
                ),
                SizedBox(height: height * 0.03),
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
                SizedBox(height: height * 0.015),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const ResetPasswordScreen(),
                        ),
                      );
                    },
                    child: Text(
                      "Forgot Password?",
                      style: GoogleFonts.poppins(
                        color: primaryColor,
                        fontSize: width * 0.04,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                if (errorMessage.isNotEmpty)
                  Center(
                    child: Padding(
                      padding: EdgeInsets.only(top: height * 0.03),
                      child: Text(
                        errorMessage,
                        style: GoogleFonts.poppins(color: errorColor),
                      ),
                    ),
                  ),
                SizedBox(height: height * 0.1),
                isLoading
                    ? const Center(
                        child: CircularProgressIndicator(
                          color: primaryColor,
                          strokeWidth: 5,
                        ),
                      )
                    : CustomButton(
                        onPressed: () async => await _login(),
                        height: height * 0.07,
                        width: double.infinity,
                        buttonColor: primaryColor,
                        buttonText: 'Login',
                        buttonTextColor: whiteColor,
                        fontSize: width * 0.05,
                      ),
                SizedBox(height: height * 0.025),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an account yet?",
                      style: GoogleFonts.poppins(
                        color: blackColor,
                        fontSize: width * 0.038,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const SignupScreen(),
                          ),
                        );
                      },
                      child: Text(
                        "Sign Up",
                        style: GoogleFonts.poppins(
                          color: primaryColor,
                          fontSize: width * 0.038,
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
