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
  void _showAllTasks(List<Task> tasks) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return FractionallySizedBox(
          heightFactor: 0.85,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(height: 12),
                  Text(
                    "All Tasks",
                    style: AppTextStyles.heading2.copyWith(
                      color: AppColors.primary,
                      fontSize: 24,
                    ),
                  ),
                  const SizedBox(height: 12),
                  tasks.isEmpty
                      ? Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            children: [
                              Text(
                                "You have no tasks scheduled yet.",
                                style: TextStyle(
                                  fontSize: 18,
                                  color: const Color.fromARGB(255, 0, 0, 0),
                                ),
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(height: 10),
                              Text(
                                "Tap the button below to add new task schedules.",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.grey[600],
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        )
                      : ListView.builder(
                          shrinkWrap: true,
                          itemCount: tasks.length,
                          itemBuilder: (context, index) {
                            final task = tasks[index];
                            return ListTile(
                              title: Text(task.title),
                              subtitle: Text(
                                  'Due: ${task.dueDate}, Hours: ${task.hours}, Status: ${task.status}'),
                            );
                          },
                        ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskBloc, TaskState>(
      builder: (context, state) {
        if (state is TasksLoaded) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              state.tasks.isEmpty
                  ? Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          Text(
                            "You have no tasks scheduled yet.",
                            style: TextStyle(
                              fontSize: 18,
                              color: AppColors.primary,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: 10),
                          Text(
                            "Tap the button below to add new task schedules.",
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey[600],
                            ),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: 20),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => AddTaskPage(),
                                ),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.primary,
                            ),
                            child: Text('Add Task', style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),),
                          ),
                        ],
                      ),
                    )
                  : ListView.builder(
                      shrinkWrap: true,
                      itemCount: state.tasks.length,
                      itemBuilder: (context, index) {
                        final task = state.tasks[index];
                        return ListTile(
                          title: Text(task.title),
                          subtitle: Text(
                              'Due: ${task.dueDate}, Hours: ${task.hours}, Status: ${task.status}'),
                        );
                      },
                    ),
            ],
          );
        }
        return Center(child: CircularProgressIndicator());
      },
    );
  }
}
