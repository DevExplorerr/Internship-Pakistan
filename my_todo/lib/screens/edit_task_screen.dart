// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_todo/model/task_model.dart';
import 'package:my_todo/widgets/colors.dart';
import 'package:my_todo/widgets/custom_button.dart';
import 'package:my_todo/widgets/custom_textfield.dart';

class EditTaskScreen extends StatefulWidget {
  final Task task;
  final int index;
  const EditTaskScreen({super.key, required this.task, required this.index});

  @override
  State<EditTaskScreen> createState() => EditTaskScreenState();
}

class EditTaskScreenState extends State<EditTaskScreen> {
  late TextEditingController _titleController;
  late TextEditingController _descriptionController;
  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(text: widget.task.title);
    _descriptionController = TextEditingController(
      text: widget.task.description,
    );
  }

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back, color: secondaryColor),
          ),

          title: Text(
            "Edit Task",
            style: GoogleFonts.lato(
              color: primaryTextColor,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          elevation: 0,
          backgroundColor: bgColor,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsetsGeometry.symmetric(
              horizontal: 25,
              vertical: 30,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                CustomTextfield(
                  textInputType: TextInputType.text,
                  controller: _titleController,
                ),
                const SizedBox(height: 25),
                CustomTextfield(
                  textInputType: TextInputType.multiline,
                  controller: _descriptionController,
                  maxLines: 4,
                ),
                const SizedBox(height: 40),
                CustomButton(
                  text: "Edit Task",
                  isLoading: isLoading,
                  onPressed: () async {
                    if (_titleController.text.isNotEmpty) {
                      setState(() {
                        isLoading = true;
                      });
                      await Future.delayed(const Duration(milliseconds: 500));
                      Navigator.pop(
                        context,
                        Task(
                          title: _titleController.text,
                          description: _descriptionController.text,
                          isCompleted: widget.task.isCompleted,
                        ),
                      );
                      setState(() {
                        isLoading = false;
                      });
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
