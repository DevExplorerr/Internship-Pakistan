// ignore_for_file: deprecated_member_use

import 'package:daily_expense_tracker/screens/add_expense_screen.dart';
import 'package:daily_expense_tracker/screens/expense_detail_screen.dart';
import 'package:daily_expense_tracker/widgets/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DateTime now = DateTime.now();

  late String formattedDay;
  late String formattedDate;

  @override
  void initState() {
    super.initState();
    formattedDay = DateFormat('EEEE').format(now);
    formattedDate = DateFormat('d, MMMM').format(now);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: Padding(
        padding: const EdgeInsets.only(
          right: 25,
          left: 25,
          top: 50,
          bottom: 25,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildAppBar(),
            const SizedBox(height: 30),
            buildBalanceCard(),
            const SizedBox(height: 30),
            Text(
              "Recent Expenses",
              style: GoogleFonts.poppins(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: primarytextColor,
              ),
            ),
            const SizedBox(height: 15),
            Expanded(child: buildRecentExpensesList()),
          ],
        ),
      ),
      floatingActionButton: SizedBox(
        height: 70,
        width: 70,
        child: FloatingActionButton(
          backgroundColor: primaryColor,
          elevation: 0,
          shape: const CircleBorder(),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const AddExpenseScreen()),
            );
          },
          child: const Icon(Icons.add, color: whiteColor, size: 30),
        ),
      ),
    );
  }

  Widget buildBalanceCard() {
    return Container(
      height: 160,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        gradient: LinearGradient(
          begin: Alignment.bottomRight,
          end: Alignment.topRight,
          colors: [secondaryColor, primarytextColor],
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Total Balance",
                style: GoogleFonts.poppins(
                  color: greyColor,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const Icon(Icons.more_horiz, color: whiteColor),
            ],
          ),
          Text(
            "\$3024.00",
            style: GoogleFonts.poppins(
              color: whiteColor,
              fontSize: 24,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Income
              Row(
                children: [
                  Container(
                    height: 25,
                    width: 25,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.2),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.arrow_downward,
                      color: whiteColor,
                      size: 16,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Income",
                        style: GoogleFonts.poppins(
                          color: whiteColor,
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Text(
                        "\$2350.00",
                        style: GoogleFonts.poppins(
                          color: whiteColor,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              // Expense
              Row(
                children: [
                  Container(
                    height: 25,
                    width: 25,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.2),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.arrow_upward,
                      color: whiteColor,
                      size: 16,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Expense",
                        style: GoogleFonts.poppins(
                          color: whiteColor,
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Text(
                        "\$674.00",
                        style: GoogleFonts.poppins(
                          color: whiteColor,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildRecentExpensesList() {
    final expenses = [
      {
        "title": "Groceries",
        "amount": 250,
        "date": "Aug 10, 2025",
        "notes":
            "Bought weekly groceries including fruits, vegetables, and dairy.",
      },
      {
        "title": "Electricity Bill",
        "amount": 450,
        "date": "Aug 08, 2025",
        "notes": "Monthly electricity bill payment for August.",
      },
      {
        "title": "Internet",
        "amount": 200,
        "date": "Aug 06, 2025",
        "notes": "Payment for monthly broadband subscription.",
      },
      {
        "title": "Gym Membership",
        "amount": 300,
        "date": "Aug 05, 2025",
        "notes": "Monthly gym membership renewal.",
      },
      {
        "title": "Fuel",
        "amount": 350,
        "date": "Aug 04, 2025",
        "notes": "Filled up car fuel tank.",
      },
      {
        "title": "Dining Out",
        "amount": 180,
        "date": "Aug 03, 2025",
        "notes": "Dinner at a local restaurant.",
      },
      {
        "title": "Netflix Subscription",
        "amount": 110,
        "date": "Aug 02, 2025",
        "notes": "Monthly Netflix subscription renewal.",
      },
      {
        "title": "Clothing",
        "amount": 500,
        "date": "Aug 01, 2025",
        "notes": "Bought new shirts and trousers.",
      },
      {
        "title": "Mobile Recharge",
        "amount": 80,
        "date": "Jul 30, 2025",
        "notes": "Mobile prepaid balance recharge.",
      },
      {
        "title": "Stationery",
        "amount": 120,
        "date": "Jul 28, 2025",
        "notes": "Bought pens, notebooks, and sticky notes.",
      },
      {
        "title": "Medicines",
        "amount": 240,
        "date": "Jul 27, 2025",
        "notes": "Bought prescribed medicines for the month.",
      },
    ];

    return ListView.separated(
      itemCount: expenses.length,
      separatorBuilder: (_, __) =>
          Divider(color: primarytextColor.withOpacity(0.1), thickness: 1),
      itemBuilder: (context, index) {
        final expense = expenses[index];
        return ListTile(
          tileColor: bgColor,
          contentPadding: EdgeInsets.zero,
          title: Text(
            "${expense["title"]!}",
            style: GoogleFonts.poppins(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: primarytextColor,
            ),
          ),
          subtitle: Text(
            "${expense["date"]!}",
            style: GoogleFonts.poppins(fontSize: 12, color: secondarytextColor),
          ),
          trailing: Text(
            "-\$${expense["amount"]}",
            style: GoogleFonts.poppins(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Colors.redAccent,
            ),
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => ExpenseDetailsScreen(
                  title: expense["title"].toString(),
                  amount: expense["amount"].toString(),
                  date: expense["date"].toString(),
                  notes: expense["notes"].toString(),
                ),
              ),
            );
          },
        );
      },
    );
  }

  Widget buildAppBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              formattedDay,
              style: GoogleFonts.poppins(
                color: secondarytextColor,
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),
            Text(
              formattedDate,
              style: GoogleFonts.poppins(
                color: primarytextColor,
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        const Icon(Icons.notifications_none, color: blackColor, size: 30),
      ],
    );
  }
}
