// ignore_for_file: use_build_context_synchronously

import 'package:daily_expense_tracker/widgets/custom_button.dart';
import 'package:daily_expense_tracker/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import '../widgets/colors.dart';

class AddExpenseScreen extends StatefulWidget {
  const AddExpenseScreen({super.key});

  @override
  State<AddExpenseScreen> createState() => _AddExpenseScreenState();
}

class _AddExpenseScreenState extends State<AddExpenseScreen> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime? _selectedDate;

  void _pickDate() async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              surface: bgColor,
              primary: primaryColor,
              onPrimary: whiteColor,
              onSurface: primarytextColor,
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(foregroundColor: primaryColor),
            ),
          ),
          child: child!,
        );
      },
    );

    if (pickedDate != null) {
      setState(() => _selectedDate = pickedDate);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: bgColor,
        appBar: AppBar(
          toolbarHeight: 80,
          backgroundColor: primaryColor,
          elevation: 0,
          title: Text(
            "Add Expense",
            style: GoogleFonts.poppins(
              color: whiteColor,
              fontWeight: FontWeight.w600,
            ),
          ),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: whiteColor),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 40, right: 20, left: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Title Field
              CustomTextfield(
                hintText: 'Expense Title',
                textInputType: TextInputType.text,
                controller: _titleController,
              ),
              const SizedBox(height: 25),

              // Amount Field
              CustomTextfield(
                hintText: "Amount",
                textInputType: TextInputType.number,
                controller: _amountController,
              ),
              const SizedBox(height: 25),

              // Date Picker Styled
              GestureDetector(
                onTap: _pickDate,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 14,
                    horizontal: 16,
                  ),

                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: bgColor,
                    boxShadow: [
                      BoxShadow(
                        color: shadowColor,
                        spreadRadius: 0,
                        blurRadius: 12,
                        offset: Offset(3, 3),
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        _selectedDate == null
                            ? "Choose Date"
                            : DateFormat.yMMMd().format(_selectedDate!),
                        style: GoogleFonts.poppins(
                          color: _selectedDate == null
                              ? greyColor
                              : primarytextColor,
                        ),
                      ),
                      const Icon(Icons.calendar_today, color: blackColor),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 40),

              // Save Button
              CustomButton(
                text: "Save",
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      elevation: 0,
                      duration: Duration(milliseconds: 400),
                      behavior: SnackBarBehavior.floating,
                      margin: EdgeInsets.symmetric(vertical: 7, horizontal: 10),
                      padding: EdgeInsets.symmetric(
                        vertical: 20,
                        horizontal: 15,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      backgroundColor: primaryColor,
                      content: Text(
                        "Expense Saved!",
                        style: GoogleFonts.poppins(
                          color: whiteColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  );
                  Future.delayed(Duration(milliseconds: 600), () {
                    Navigator.pop(context);
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
