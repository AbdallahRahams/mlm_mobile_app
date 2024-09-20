import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import '../../../app_colors.dart';
import '../../../data/models/task.dart';
import '../../bloc/task/task_bloc.dart';

class AddTaskPage extends StatefulWidget {
  @override
  _AddTaskPageState createState() => _AddTaskPageState();
}

class _AddTaskPageState extends State<AddTaskPage> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _dueDateController = TextEditingController();
  final TextEditingController _hoursController = TextEditingController();
  DateTime? _selectedDate;
  TimeOfDay? _selectedTime;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        title: Text('Add New Task', style: TextStyle(color: Colors.white)),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Task Title Input
            TextField(
              controller: _titleController,
              decoration: InputDecoration(
                labelText: 'Task Title',
                labelStyle: TextStyle(color: AppColors.primary),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.primary),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.primary),
                ),
              ),
            ),
            SizedBox(height: 20),
            // Date Selector
            TextField(
              controller: _dueDateController,
              readOnly: true,
              onTap: _selectDueDate,
              decoration: InputDecoration(
                labelText: 'Due Date',
                labelStyle: TextStyle(color: AppColors.primary),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.primary),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.primary),
                ),
              ),
            ),
            SizedBox(height: 20),
            // Task Hours Selector
            TextField(
              controller: _hoursController,
              readOnly: true,
              onTap: _selectTime,
              decoration: InputDecoration(
                labelText: 'Task Hours',
                labelStyle: TextStyle(color: AppColors.primary),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.primary),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.primary),
                ),
              ),
            ),
            SizedBox(height: 20),
            // Save Task Button
            ElevatedButton(
              onPressed: () {
                final task = Task(
                  title: _titleController.text,
                  dueDate: _dueDateController.text,
                  hours: _selectedTime != null
                      ? _selectedTime!.hour * 60 + _selectedTime!.minute
                      : 0,
                  status: 'Pending',
                );
                context.read<TaskBloc>().add(AddTaskEvent(task: task));
                Navigator.pop(context);  // Pop and notify other pages to reload
              },
              child: Text('Add Task'),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Function to show date picker and update the due date
  Future<void> _selectDueDate() async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (pickedDate != null && pickedDate != _selectedDate) {
      setState(() {
        _selectedDate = pickedDate;
        _dueDateController.text = DateFormat('MM-dd-yyyy').format(pickedDate);
      });
    }
  }

  // Function to show time picker and update the task hours
  Future<void> _selectTime() async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (pickedTime != null && pickedTime != _selectedTime) {
      setState(() {
        _selectedTime = pickedTime;
        _hoursController.text = '${pickedTime.hour}h ${pickedTime.minute}m'; // Display formatted time
      });
    }
  }
}
