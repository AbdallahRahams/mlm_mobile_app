import 'package:flutter/material.dart';
import 'package:mlm_mobile_app/app_colors.dart'; // Import your custom colors
import 'package:mlm_mobile_app/text_styles.dart'; // Import your custom text styles

class TasksPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        title: Text('Tasks', style: AppTextStyles.heading21),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.add, color: Colors.white),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AddTaskPage()),
              );
            },
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Your Tasks',
                style: AppTextStyles.subheading2,
              ),
              SizedBox(height: 10),
              Expanded(
                child: ListView(
                  children: [
                    _buildTaskTile(
                      task: 'Complete Flutter tutorial',
                      dueDate: '2024-09-15',
                      isCompleted: false,
                    ),
                    _buildTaskTile(
                      task: 'Update app documentation',
                      dueDate: '2024-09-20',
                      isCompleted: true,
                    ),
                    _buildTaskTile(
                      task: 'Review code',
                      dueDate: '2024-09-25',
                      isCompleted: false,
                    ),
                    // Add more tasks here
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTaskTile({
    required String task,
    required String dueDate,
    required bool isCompleted,
  }) {
    return Card(
      elevation: 3,
      margin: EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      color: Colors.white,
      child: ListTile(
        leading: Checkbox(
          value: isCompleted,
          onChanged: (bool? value) {
            // Handle task completion toggle
          },
          activeColor: AppColors.secondary, // Set the color of the checked checkbox
        ),
        title: Text(
          task,
          style: TextStyle(
            decoration: isCompleted ? TextDecoration.lineThrough : TextDecoration.none,
            color: isCompleted ? Colors.grey : AppColors.text,
          ),
        ),
        subtitle: Text('Due: $dueDate', style: TextStyle(color: Colors.grey)),
        trailing: IconButton(
          icon: Icon(Icons.delete, color: AppColors.error),
          onPressed: () {
            // Handle delete task action
          },
        ),
      ),
    );
  }
}

class AddTaskPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        title: Text('Add Task', style: AppTextStyles.heading21),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'New Task',
                style: AppTextStyles.subheading2,
              ),
              SizedBox(height: 10),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Task Title',
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                ),
                maxLength: 50,
              ),
              SizedBox(height: 16),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Due Date',
                  border: OutlineInputBorder(),
                  hintText: 'YYYY-MM-DD',
                  contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                ),
                keyboardType: TextInputType.datetime,
              ),
              SizedBox(height: 16),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.secondary,
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                onPressed: () {
                  // Handle Add Task action
                },
                child: Text('Add Task', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
