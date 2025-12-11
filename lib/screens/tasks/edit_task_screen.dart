import 'package:flutter/material.dart';
import 'package:task_event_manager_new/models/task_model.dart';

class EditTaskScreen extends StatefulWidget {
  final Task task;
  final int index;

  const EditTaskScreen({super.key, required this.task, required this.index});

  @override
  State<EditTaskScreen> createState() => _EditTaskScreenState();
}

class _EditTaskScreenState extends State<EditTaskScreen> {
  late TextEditingController _titleController;
  late TextEditingController _descriptionController;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(text: widget.task.title);
    _descriptionController =
        TextEditingController(text: widget.task.description);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Edit Task")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _titleController,
              decoration: const InputDecoration(
                labelText: "Task Title",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _descriptionController,
              decoration: const InputDecoration(
                labelText: "Description",
                border: OutlineInputBorder(),
              ),
              maxLines: 3,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                widget.task.title = _titleController.text.trim();
                widget.task.description = _descriptionController.text.trim();

                widget.task.save(); // Update in Hive

                Navigator.pop(context);
              },
              child: const Text("Update Task"),
            ),
          ],
        ),
      ),
    );
  }
}
