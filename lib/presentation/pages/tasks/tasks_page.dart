import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import '../../../app_colors.dart';
import '../../../data/models/task.dart';
import '../../../text_styles.dart';
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
            horizontal: screenSize.width * 0.05, // Adjusted dynamic horizontal padding
            vertical: screenSize.height * 0.03, // Adjusted dynamic vertical padding
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
      title: Text('Tasks', style: AppTextStyles.appBartext.copyWith(color: AppColors.primary)),
      leading: IconButton(
        icon: const Icon(Iconsax.arrow_left, color: AppColors.primary),
        onPressed: () => Navigator.pop(context),
      ),
      centerTitle: true,
      actions: [
        IconButton(
          icon: const Icon(Iconsax.add, color: AppColors.primary),
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
      padding: EdgeInsets.symmetric(vertical: screenSize.height * 0.01), // Dynamic padding between tasks
      itemBuilder: (context, index) {
        final task = tasks[index];
        return TaskTile(task: task, screenSize: screenSize);
      },
    );
  }

    Widget _buildEmptyState(BuildContext context, Size screenSize) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: screenSize.width * 0.7, // Slightly reduced image width
                  height: screenSize.height * 0.25, // Adjusted image height for better spacing
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15), // Increased rounded corners for modern look
                    child: Image.asset(
                      'assets/images/no_task.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  'No tasks available yet. Click the + button to add a new task.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: AppColors.text.withOpacity(0.7), // Softer color for a balanced feel
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

}

class TaskTile extends StatelessWidget {
  final Task task;
  final Size screenSize;

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
      elevation: 5, // Added elevation for better visual separation
      margin: EdgeInsets.symmetric(
        vertical: screenSize.height * 0.015, // Slightly increased spacing between tasks
        horizontal: screenSize.width * 0.03, // Adjusted padding for balance
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16), // Modern rounded corners
      ),
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(
          vertical: screenSize.height * 0.01,
          horizontal: screenSize.width * 0.04,
        ),
        title: Text(
          task.title,
          style: TextStyle(
            decoration: task.status == "Completed"
                ? TextDecoration.lineThrough
                : TextDecoration.none,
            color: task.status == "Completed" ? Colors.grey : AppColors.text,
            fontWeight: FontWeight.bold, // Added bold for emphasis
            fontSize: screenSize.width * 0.045, // Responsive font size
          ),
        ),
        subtitle: Text(
          'Due: ${dueDate != null ? dueDate.toString() : 'Invalid Date'} ${task.getTaskStatus()}',
          style: TextStyle(
            color: Colors.grey.shade600,
            fontSize: screenSize.width * 0.035, // Responsive subtitle font size
          ),
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