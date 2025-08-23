import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_todo/model/task_model.dart';
import 'package:my_todo/widgets/colors.dart';
import 'package:my_todo/screens/add_task_screen.dart';
import 'package:my_todo/widgets/task_tile.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Task> tasks = [];
  String searchQuery = "";

  @override
  void initState() {
    super.initState();
    loadTask();
  }

  Future<void> saveTasks() async {
    final prefs = await SharedPreferences.getInstance();
    final taskList = tasks.map((task) => jsonEncode(task.toJson())).toList();
    await prefs.setStringList('tasks', taskList);
  }

  Future<void> loadTask() async {
    final prefs = await SharedPreferences.getInstance();
    final taskList = prefs.getStringList('tasks');

    if (taskList != null) {
      setState(() {
        tasks = taskList
            .map((task) => Task.fromJson(jsonDecode(task)))
            .toList();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // filter tasks by search
    final filteredTasks = tasks
        .where(
          (task) =>
              task.title.toLowerCase().contains(searchQuery.toLowerCase()) ||
              task.description.toLowerCase().contains(
                searchQuery.toLowerCase(),
              ),
        )
        .toList();

    // split pending and completed
    final pendingTasks = filteredTasks
        .where((task) => !(task.isCompleted ?? false))
        .toList();
    final completedTasks = filteredTasks
        .where((task) => (task.isCompleted ?? false))
        .toList();

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: bgColor,
        body: tasks.isEmpty
            ? emptyTasksView()
            : Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 35,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 40),
                    taskSearchField(),
                    const SizedBox(height: 40),

                    // Pending section
                    Expanded(
                      child: ListView(
                        children: [
                          taskStatusWidget("Pending"),
                          const SizedBox(height: 18),
                          ...pendingTasks.map(
                            (task) => Padding(
                              padding: const EdgeInsets.only(bottom: 15.0),
                              child: TaskTile(
                                task: task,
                                onEdit: (updatedTask) {
                                  setState(() {
                                    final index = tasks.indexOf(task);
                                    tasks[index] = updatedTask;
                                  });
                                  saveTasks();
                                },
                                onDelete: () {
                                  setState(() {
                                    tasks.remove(task);
                                  });
                                  saveTasks();
                                },
                                onToggleComplete: (value) {
                                  setState(() {
                                    task.isCompleted = value;
                                  });
                                  saveTasks();
                                },
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),

                          //  Completed section
                          taskStatusWidget("Completed"),
                          const SizedBox(height: 18),
                          ...completedTasks.map(
                            (task) => Padding(
                              padding: const EdgeInsets.only(bottom: 15.0),
                              child: TaskTile(
                                task: task,
                                onEdit: (updatedTask) {
                                  setState(() {
                                    final index = tasks.indexOf(task);
                                    tasks[index] = updatedTask;
                                  });
                                  saveTasks();
                                },
                                onDelete: () {
                                  setState(() {
                                    tasks.remove(task);
                                  });
                                  saveTasks();
                                },
                                onToggleComplete: (value) {
                                  setState(() {
                                    task.isCompleted = value;
                                  });
                                  saveTasks();
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
        floatingActionButton: FloatingActionButton.extended(
          backgroundColor: primaryColor,
          elevation: 0,
          onPressed: () async {
            final newTask = await Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const AddTaskScreen()),
            );
            if (newTask != null) {
              setState(() {
                tasks.add(newTask);
              });
              saveTasks();
            }
          },
          label: Row(
            children: [
              const Icon(Icons.add, color: secondaryColor, size: 30),
              const SizedBox(width: 5),
              Text(
                "Add Task",
                style: GoogleFonts.rubik(
                  fontSize: 16,
                  color: primaryTextColor,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget emptyTasksView() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/images/home_screen.png'),
          const SizedBox(height: 25),
          Text(
            "What do you want to do today?",
            style: GoogleFonts.lato(
              color: primaryTextColor,
              fontSize: 20,
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            "Tap + to add your tasks",
            style: GoogleFonts.lato(
              color: primaryTextColor,
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }

  Widget taskSearchField() {
    return TextField(
      onChanged: (value) {
        setState(() {
          searchQuery = value;
        });
      },
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(
          vertical: 14,
          horizontal: 16,
        ),
        hintText: 'Search task',
        hintStyle: GoogleFonts.lato(
          color: secondaryTextColor,
          fontSize: 17,
          fontWeight: FontWeight.w400,
        ),
        prefixIcon: const Icon(Icons.search, color: secondaryTextColor),
        filled: true,
        fillColor: searchFieldColor,
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: borderSideColor),
          borderRadius: BorderRadius.circular(4),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: borderSideColor),
          borderRadius: BorderRadius.circular(4),
        ),
      ),
      style: GoogleFonts.lato(color: secondaryColor),
    );
  }

  Widget taskStatusWidget(String text) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        height: 45,
        width: 125,
        decoration: BoxDecoration(
          color: listTileColor,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: Text(
            text,
            style: GoogleFonts.rubik(
              color: primaryTextColor,
              fontSize: 13,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ),
    );
  }
}
