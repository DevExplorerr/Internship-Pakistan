import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widgets/colors.dart';

class ExpenseDetailsScreen extends StatelessWidget {
  final String title;
  final String amount;
  final String date;
  final String notes;
  const ExpenseDetailsScreen({
    super.key,
    required this.title,
    required this.amount,
    required this.date,
    required this.notes,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        toolbarHeight: 80,
        elevation: 0,
        backgroundColor: primaryColor,
        title: Text(
          "Expense Details",
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
        child: Container(
          width: double.infinity,
          height: 225,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 8,
                offset: Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              detailRow("Title:", title),
              const SizedBox(height: 15),
              detailRow("Amount:", "\$$amount"),
              const SizedBox(height: 15),
              detailRow("Date:", date),
              const SizedBox(height: 15),
              detailRow("Notes:", notes),
            ],
          ),
        ),
      ),
    );
  }

  Widget detailRow(String label, String value) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: GoogleFonts.poppins(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: secondaryColor,
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            value,
            style: GoogleFonts.poppins(fontSize: 15, color: blackColor),
          ),
        ),
      ],
    );
  }
}
