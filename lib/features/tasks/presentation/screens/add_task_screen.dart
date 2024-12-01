import 'package:flutter/material.dart';

class AddTaskScreen extends StatelessWidget {
  final Function(String title, String description) onSave;

  AddTaskScreen({super.key, required this.onSave});

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Add Task")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _titleController,
              decoration: const InputDecoration(labelText: "Task Title"),
            ),
            TextField(
              controller: _descriptionController,
              decoration: const InputDecoration(labelText: "Task Description"),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                final title = _titleController.text.trim();
                final description = _descriptionController.text.trim();
                if (title.isNotEmpty && description.isNotEmpty) {
                  onSave(title, description);
                  Navigator.pop(context);
                }
              },
              child: const Text("Save Task"),
            )
          ],
        ),
      ),
    );
  }
}
