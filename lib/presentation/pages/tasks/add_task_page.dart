import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:iconsax/iconsax.dart';
import 'package:mlm_mobile_app/text_styles.dart';
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
      backgroundColor: AppColors.whiteTheme,
      appBar: AppBar(
        title: Text('Add New Task', style: AppTextStyles.appBartext.copyWith(color: AppColors.primary)),
        leading: IconButton(
          icon: const Icon(Iconsax.arrow_left, color: AppColors.primary),
          onPressed: () => Navigator.pop(context),
        ),
        centerTitle: true,
        backgroundColor: AppColors.whiteTheme,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: 200, // Adjust the height for a smaller image
              margin: const EdgeInsets.symmetric(vertical: 10), // Optional margin for spacing
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12.0), // Optional for rounded corners
                child: Image.asset(
                  'assets/images/productivity_banner.png', // Path to the image
                  fit: BoxFit.contain, // Ensures the image scales down within its container
                ),
              ),
            ),
            const SizedBox(height: 20),
            _buildInputField(
              controller: _titleController,
              label: 'Task Title',
              icon: Iconsax.edit,
              description: 'Enter a title for your task, e.g., "Prepare presentation".',
            ),
            const SizedBox(height: 10),
            _buildInputField(
              controller: _dueDateController,
              label: 'Due Date',
              icon: Iconsax.calendar_1,
              readOnly: true,
              onTap: _selectDueDate,
              description: 'Select a deadline for this task.',
            ),
            const SizedBox(height: 10),
            _buildInputField(
              controller: _hoursController,
              label: 'Task Hours',
              icon: Iconsax.clock,
              readOnly: true,
              onTap: _selectTime,
              description: 'Specify the time you expect to work on this task.',
            ),
            const SizedBox(height: 40),
            Center(
              child: ElevatedButton(
                onPressed: _addTask,
                style: ElevatedButton.styleFrom(
                  foregroundColor: const Color.fromARGB(255, 255, 255, 255),
                  backgroundColor: AppColors.primary,
                  padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 6,
                  shadowColor: Colors.black45,
                ),
                child: const Text('Add Task', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Reusable input field with a description
  Widget _buildInputField({
    required TextEditingController controller,
    required String label,
    required IconData icon,
    bool readOnly = false,
    Function()? onTap,
    String? description, // Optional description text
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextField(
          controller: controller,
          readOnly: readOnly,
          onTap: onTap,
          decoration: InputDecoration(
            labelText: label,
            labelStyle: TextStyle(color: AppColors.primary),
            prefixIcon: Icon(icon, color: AppColors.primary),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.0),
              borderSide: BorderSide(color: AppColors.primary),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.0),
              borderSide: BorderSide(color: AppColors.primary.withOpacity(0.5)),
            ),
            contentPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
          ),
        ),
        if (description != null)
          Padding(
            padding: const EdgeInsets.only(top: 5),
            child: Text(
              description,
              style: const TextStyle(color: Colors.grey, fontSize: 12),
            ),
          ),
      ],
    );
  }

  Future<void> _selectDueDate() async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
      builder: (context, child) {
        return Theme(
          data: ThemeData.light().copyWith(
            primaryColor: AppColors.primary, // Set primary color
            colorScheme: ColorScheme.light(primary: AppColors.primary), // Set color scheme
            buttonTheme: ButtonThemeData(textTheme: ButtonTextTheme.primary),
          ),
          child: child!,
        );
      },
    );
    if (pickedDate != null) {
      setState(() {
        _selectedDate = pickedDate;
        _dueDateController.text = DateFormat('MM-dd-yyyy').format(pickedDate);
      });
    }
  }

  Future<void> _selectTime() async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
      builder: (context, child) {
        return Theme(
          data: ThemeData.light().copyWith(
            primaryColor: AppColors.primary, // Set primary color
            colorScheme: ColorScheme.light(primary: AppColors.primary), // Set color scheme
            buttonTheme: ButtonThemeData(textTheme: ButtonTextTheme.primary),
          ),
          child: child!,
        );
      },
    );
    if (pickedTime != null) {
      setState(() {
        _selectedTime = pickedTime;
        _hoursController.text = '${pickedTime.hour}h ${pickedTime.minute}m';
      });
    }
  }

  void _addTask() {
    final task = Task(
      title: _titleController.text,
      dueDate: _dueDateController.text,
      hours: _selectedTime != null
          ? _selectedTime!.hour * 60 + _selectedTime!.minute
          : 0,
      status: 'Pending',
    );
    context.read<TaskBloc>().add(AddTaskEvent(task: task));
    Navigator.pop(context);
  }
}