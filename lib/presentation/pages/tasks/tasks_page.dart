import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import '../../../app_colors.dart';
import '../../../data/models/task.dart';
import '../../bloc/task/task_bloc.dart';
import 'add_task_page.dart';

class TasksPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size; // Get screen size for responsiveness
    
    return Scaffold(
      appBar: _buildAppBar(context),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: screenSize.width * 0.04, // Dynamic horizontal padding
            vertical: screenSize.height * 0.02, // Dynamic vertical padding
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: BlocBuilder<TaskBloc, TaskState>(
                  builder: (context, state) {
                    if (state is TasksLoaded) {
                      return state.tasks.isEmpty
                          ? _buildEmptyState(context, screenSize)
                          : _buildTaskList(state.tasks, context, screenSize);
                    }
                    return const Center(child: CircularProgressIndicator());
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.primary,
      title: const Text('Tasks', style: TextStyle(color: Colors.white)),
      centerTitle: true,
      leading: IconButton(
        icon: const Icon(Iconsax.arrow_left, color: AppColors.secondary),
        onPressed: () => Navigator.pop(context),
      ),
      actions: [
        IconButton(
          icon: const Icon(Iconsax.add, color: Colors.white),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AddTaskPage()),
            );
          },
        ),
      ],
    );
  }

  Widget _buildTaskList(List<Task> tasks, BuildContext context, Size screenSize) {
    return ListView.builder(
      itemCount: tasks.length,
      itemBuilder: (context, index) {
        final task = tasks[index];
        return TaskTile(task: task, screenSize: screenSize); // Pass screen size to task tile for responsiveness
      },
    );
  }

  Widget _buildEmptyState(BuildContext context, Size screenSize) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: screenSize.width * 0.8, // Responsive image width
            height: screenSize.height * 0.3, // Responsive image height
            margin: const EdgeInsets.symmetric(vertical: 10),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12.0),
              child: Image.asset(
                'assets/images/no_task.png',
                fit: BoxFit.contain,
              ),
            ),
          ),
          Center(
  child: Text(
    'No tasks available yet. Click the plus button to add your new task.',
    style: TextStyle(color: Colors.grey, fontSize: 18),
  ),
),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}

class TaskTile extends StatelessWidget {
  final Task task;
  final Size screenSize; // Accept screen size for responsive design

  const TaskTile({required this.task, required this.screenSize});

  @override
  Widget build(BuildContext context) {
    DateTime? dueDate;
    try {
      dueDate = DateTime.parse(task.dueDate);
    } catch (e) {
      dueDate = null;
    }

    return Card(
      elevation: 3,
      margin: EdgeInsets.symmetric(
        vertical: screenSize.height * 0.01, // Responsive vertical margin
        horizontal: screenSize.width * 0.02, // Responsive horizontal margin
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        title: Text(
          task.title,
          style: TextStyle(
            decoration: task.status == "Completed"
                ? TextDecoration.lineThrough
                : TextDecoration.none,
            color: task.status == "Completed" ? Colors.grey : AppColors.text,
          ),
        ),
        subtitle: Text(
          'Due: ${dueDate != null ? dueDate.toString() : 'Invalid Date'} ${task.getTaskStatus()}',
          style: const TextStyle(color: Colors.grey),
        ),
        trailing: IconButton(
          icon: const Icon(Iconsax.trash, color: AppColors.error),
          onPressed: () {
            context.read<TaskBloc>().add(DeleteTaskEvent(task: task));
          },
        ),
      ),
    );
  }
}

// Extension method to clean up task status logic
extension TaskStatusExtension on Task {
  String getTaskStatus() {
    if (status == "Completed") return "(Completed)";
    return isOverdue() ? "(Overdue)" : "(Pending)";
  }
}