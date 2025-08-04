import 'package:flutter/material.dart';
import 'package:my_first_flutter_app/colors.dart';

class ContactForm extends StatefulWidget {
  const ContactForm({super.key});

  @override
  State<ContactForm> createState() => _ContactFormState();
}

class _ContactFormState extends State<ContactForm> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController messageController = TextEditingController();

  @override
  void dispose() {
    //clean up the controllers
    nameController.dispose();
    emailController.dispose();
    messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        toolbarHeight: 80,
        centerTitle: true,
        elevation: 0,
        backgroundColor: bgColor,
        title: Text(
          "Contact Me",
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: primaryColor,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            //Name
            _buildLabelText("Full Name"),
            const SizedBox(height: 5),
            _buildTextField(
                textInputType: TextInputType.name, controller: nameController),
            const SizedBox(height: 30),
            //Email
            _buildLabelText("Email"),
            const SizedBox(height: 5),
            _buildTextField(
                textInputType: TextInputType.emailAddress,
                controller: emailController),
            const SizedBox(height: 30),
            //Message
            _buildLabelText("Message"),
            const SizedBox(height: 5),
            _buildTextField(
                textInputType: TextInputType.multiline,
                controller: messageController,
                maxLines: 4),
            //Submit Button
            const SizedBox(height: 30),
            _buildSubmitButton()
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(
      {required TextInputType textInputType,
      required TextEditingController controller,
      int maxLines = 1}) {
    return TextFormField(
      controller: controller,
      keyboardType: textInputType,
      maxLines: maxLines,
      style: TextStyle(color: blackColor),
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: primaryColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: primaryColor),
        ),
      ),
    );
  }

  Widget _buildLabelText(String text) {
    return Text(
      text,
      style: const TextStyle(
          fontSize: 20, fontWeight: FontWeight.w700, color: blackColor),
    );
  }

  Widget _buildSubmitButton() {
    return Center(
      child: SizedBox(
        height: 50,
        width: 120,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            overlayColor: Colors.white,
            backgroundColor: primaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          onPressed: () {
            if (nameController.text.isEmpty &&
                emailController.text.isEmpty &&
                messageController.text.isEmpty) {
              ScaffoldMessenger.of(context).showSnackBar(
                _buildSnackBar("Please fill all fields", Colors.red),
              );
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                _buildSnackBar("Thank you for reaching out!", primaryColor),
              );
            }
          },
          child: Text(
            "Submit",
            style: const TextStyle(
                fontSize: 20, fontWeight: FontWeight.w700, color: bgColor),
          ),
        ),
      ),
    );
  }

  SnackBar _buildSnackBar(String text, Color color) {
    return SnackBar(
      behavior: SnackBarBehavior.floating,
      elevation: 0,
      backgroundColor: color,
      margin: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      padding: EdgeInsets.all(20),
      content: Text(
        text,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: bgColor,
        ),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(8),
        ),
      ),
    );
  }
}
