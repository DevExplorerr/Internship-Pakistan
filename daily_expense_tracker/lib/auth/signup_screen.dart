import 'package:daily_expense_tracker/auth/login_screen.dart';
import 'package:daily_expense_tracker/screens/home_screen.dart';
import 'package:daily_expense_tracker/widgets/colors.dart';
import 'package:daily_expense_tracker/widgets/custom_button.dart';
import 'package:daily_expense_tracker/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    final TextEditingController nameController = TextEditingController();
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Scaffold(
          backgroundColor: bgColor,
          appBar: AppBar(
            backgroundColor: bgColor,
            toolbarHeight: 100,
            centerTitle: true,
            elevation: 0,
            title: Text(
              'Register',
              style: GoogleFonts.poppins(
                color: primarytextColor,
                fontSize: 24,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 40),
              child: Column(
                children: [
                  const SizedBox(height: 40),
                  CustomTextfield(
                    controller: nameController,
                    hintText: "Name",
                    textInputType: TextInputType.name,
                  ),
                  const SizedBox(height: 30),
                  CustomTextfield(
                    controller: emailController,
                    hintText: "Email address",
                    textInputType: TextInputType.emailAddress,
                  ),
                  const SizedBox(height: 30),
                  CustomTextfield(
                    controller: passwordController,
                    hintText: "Password",
                    textInputType: TextInputType.visiblePassword,
                    suffixIcon: Icon(
                      Icons.visibility_off,
                      color: secondarytextColor,
                    ),
                  ),
                  const SizedBox(height: 45),
                  CustomButton(
                    text: "Signup",
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const HomeScreen(),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 25),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Already have an account?",
                        style: GoogleFonts.poppins(
                          color: primarytextColor,
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const LoginScreen(),
                            ),
                          );
                        },
                        child: Text(
                          "Login",
                          style: GoogleFonts.poppins(
                            color: primarytextColor,
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            decoration: TextDecoration.underline,
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
      ),
    );
  }
}
