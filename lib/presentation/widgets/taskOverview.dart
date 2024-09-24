import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import '../../app_colors.dart';
import '../../data/models/task.dart';
import '../../text_styles.dart';
import '../bloc/task/task_bloc.dart';
import '../pages/tasks/add_task_page.dart';

class TaskOverviewWidget extends StatefulWidget {
  @override
  _TaskOverviewWidgetState createState() => _TaskOverviewWidgetState();
}

class _TaskOverviewWidgetState extends State<TaskOverviewWidget> {
  // Function to group tasks by status and return a map
  Map<String, List<Task>> _groupTasksByStatus(List<Task> tasks) {
    Map<String, List<Task>> taskMap = {
      'Pending': [],
      'In Progress': [],
      'Completed': []
    };

    for (var task in tasks) {
      taskMap[task.status]?.add(task);
    }
    return taskMap;
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskBloc, TaskState>(
      builder: (context, state) {
        if (state is TasksLoaded) {
          // Group tasks by status
          final groupedTasks = _groupTasksByStatus(state.tasks);

          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 10),
              // Header with "My Tasks" and add button
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'My Tasks',
                      style: AppTextStyles.heading2,
                    ),
                    IconButton(
                      icon: const Icon(Iconsax.add, size: 24),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AddTaskPage(),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              // Overview of task counts by status with ExpansionTile
              ...groupedTasks.entries.map((entry) {
                final status = entry.key;
                final tasks = entry.value;
                return _buildTaskGroup(status, tasks);
              }).toList(),
              const SizedBox(height: 30),
            ],
          );
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }

  // Function to build individual task groups with dropdown functionality
  Widget _buildTaskGroup(String status, List<Task> tasks) {
    return ExpansionTile(
      title: Text(
        '$status (${tasks.length})',
        style: TextStyle(
          color: _getStatusColor(status),
          fontWeight: FontWeight.bold,
        ),
      ),
      iconColor: AppColors.primary,
      children: tasks.map((task) {
        return ListTile(
          title: Text(task.title),
          subtitle: Text('Due: ${task.dueDate}'),
          trailing: IconButton(
            icon: Icon(Iconsax.trash, color: AppColors.error),
            onPressed: () {
              context.read<TaskBloc>().add(DeleteTaskEvent(task: task));
            },
          ),
        );
      }).toList(),
    );
  }

  // Function to determine color based on status
  Color _getStatusColor(String status) {
    switch (status) {
      case 'Pending':
        return AppColors.primary; // Bright Yellow
      case 'In Progress':
        return AppColors.primary; // Bright Blue
      case 'Completed':
        return AppColors.primary; // Green Success
      default:
        return AppColors.primary; // Deep Blue
    }
  }
}