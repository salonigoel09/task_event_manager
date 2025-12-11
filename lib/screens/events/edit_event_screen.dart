import 'package:flutter/material.dart';
import 'package:task_event_manager_new/models/event_model.dart';

class EditEventScreen extends StatefulWidget {
  final EventModel event;
  final int index;

  const EditEventScreen({super.key, required this.event, required this.index});

  @override
  State<EditEventScreen> createState() => _EditEventScreenState();
}

class _EditEventScreenState extends State<EditEventScreen> {
  late TextEditingController _titleController;
  DateTime? _selectedDate;
  TimeOfDay? _selectedTime;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(text: widget.event.title);
    _selectedDate = widget.event.date;
    _selectedTime = TimeOfDay(
      hour: widget.event.date.hour,
      minute: widget.event.date.minute,
    );
  }

  Future<void> pickDate() async {
    DateTime? date = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
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
      initialTime: _selectedTime ?? TimeOfDay.now(),
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
      appBar: AppBar(title: const Text("Edit Event")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _titleController,
              decoration: const InputDecoration(
                labelText: "Event Title",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),

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

            Row(
              children: [
                Expanded(
                  child: Text(
                    "Time: ${_selectedTime!.format(context)}",
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
                widget.event.title = _titleController.text.trim();
                widget.event.date = _selectedDate!;
                widget.event.time = _selectedTime!.format(context);

                widget.event.save();

                Navigator.pop(context);
              },
              child: const Text("Update Event"),
            ),
          ],
        ),
      ),
    );
  }
}
