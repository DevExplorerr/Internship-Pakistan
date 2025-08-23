import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_todo/model/task_model.dart';
import 'package:my_todo/screens/edit_task_screen.dart';
import 'colors.dart';

class TaskTile extends StatelessWidget {
  final Task task;
  final Function(Task) onEdit;
  final VoidCallback onDelete;
  final Function(bool) onToggleComplete;

  const TaskTile({
    super.key,
    required this.task,
    required this.onEdit,
    required this.onDelete,
    required this.onToggleComplete,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: listTileColor,
      minTileHeight: 60,
      contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
      onTap: () async {
        final updatedTask = await Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => EditTaskScreen(task: task, index: 0),
          ),
        );
        if (updatedTask != null) onEdit(updatedTask);
      },
      leading: Transform.scale(
        scale: 1.3,
        child: Checkbox(
          value: task.isCompleted,
          onChanged: (value) => onToggleComplete(value ?? false),
          shape: const CircleBorder(),
          side: BorderSide(color: secondaryColor),
          checkColor: secondaryColor,
          activeColor: secondaryTextColor,
        ),
      ),
      title: Text(
        task.title,
        style: GoogleFonts.lato(
          color: task.isCompleted! ? secondaryTextColor : primaryTextColor,
          fontSize: 18,
          fontWeight: FontWeight.w600,
          decoration: task.isCompleted! ? TextDecoration.lineThrough : null,
          decorationColor: secondaryTextColor,
        ),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
      subtitle: Text(
        task.description,
        style: GoogleFonts.lato(
          color: task.isCompleted! ? secondaryTextColor : primaryTextColor,
          fontSize: 14,
          fontWeight: FontWeight.w400,
          decoration: task.isCompleted! ? TextDecoration.lineThrough : null,
          decorationColor: secondaryTextColor,
        ),
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      ),
      trailing: IconButton(
        onPressed: onDelete,
        icon: const Icon(
          Icons.delete_outline_outlined,
          color: secondaryIconColor,
          size: 27,
        ),
      ),
    );
  }
}
