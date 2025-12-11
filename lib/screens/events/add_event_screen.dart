import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:task_event_manager_new/models/event_model.dart';

class AddEventScreen extends StatefulWidget {
  const AddEventScreen({super.key});

  @override
  State<AddEventScreen> createState() => _AddEventScreenState();
}

class _AddEventScreenState extends State<AddEventScreen> {
  final TextEditingController _titleController = TextEditingController();
  DateTime? _selectedDate;
  TimeOfDay? _selectedTime;

  Future<void> pickDate() async {
    DateTime? date = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2050),
    );

    if (date != null) {
      setState(() {
        _selectedDate = date;
      });
    }
  }

  Future<void> pickTime() async {
    TimeOfDay? time = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (time != null) {
      setState(() {
        _selectedTime = time;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Add Event")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _titleController,
              decoration: const InputDecoration(
                labelText: "Event Title",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),

            // DATE PICKER
            Row(
              children: [
                Expanded(
                  child: Text(
                    _selectedDate == null
                        ? "Pick a date"
                        : "Date: ${_selectedDate!.toString().split(' ')[0]}",
                  ),
                ),
                ElevatedButton(
                  onPressed: pickDate,
                  child: const Text("Pick Date"),
                ),
              ],
            ),

            const SizedBox(height: 16),

            // TIME PICKER
            Row(
              children: [
                Expanded(
                  child: Text(
                    _selectedTime == null
                        ? "Pick a time"
                        : "Time: ${_selectedTime!.format(context)}",
                  ),
                ),
                ElevatedButton(
                  onPressed: pickTime,
                  child: const Text("Pick Time"),
                ),
              ],
            ),

            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                final title = _titleController.text.trim();
                if (title.isEmpty || _selectedDate == null || _selectedTime == null) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("All fields are required")),
                  );
                  return;
                }

                final event = EventModel(
                  title: title,
                  date: _selectedDate!,
                  time: _selectedTime!.format(context),
                );

                Hive.box<EventModel>('eventsBox').add(event);

                Navigator.pop(context);
              },
              child: const Text("Save Event"),
            ),
          ],
        ),
      ),
    );
  }
}
