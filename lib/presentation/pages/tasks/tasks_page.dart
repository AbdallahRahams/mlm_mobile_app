import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../app_colors.dart';
import '../../../data/models/task.dart';
import '../../bloc/task/task_bloc.dart';

import 'add_task_page.dart';

class TasksPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TaskBloc()..add(LoadTasksEvent()),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.primary,
          title: Text('Tasks', style: TextStyle(color: Colors.white)),
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
                  style: TextStyle(fontSize: 20, color: AppColors.primary),
                ),
                SizedBox(height: 10),
                Expanded(
                  child: BlocBuilder<TaskBloc, TaskState>(
                    builder: (context, state) {
                      if (state is TasksLoaded) {
                        if (state.tasks.isEmpty) {
                          return Center(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text('No tasks available.', style: TextStyle(color: Colors.grey)),
                                ElevatedButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => AddTaskPage()),
                                    );
                                  },
                                  child: Text('Add Task'),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: AppColors.primary,
                                  ),
                                ),
                              ],
                            ),
                          );
                        }

                        return ListView.builder(
                          itemCount: state.tasks.length,
                          itemBuilder: (context, index) {
                            final task = state.tasks[index];
                            return _buildTaskTile(task, context);
                          },
                        );
                      }
                      return Center(child: CircularProgressIndicator());
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTaskTile(Task task, BuildContext context) {
  DateTime? dueDate;

  // Try parsing the dueDate, if it fails, set dueDate to null
  try {
    dueDate = DateTime.parse(task.dueDate);
  } catch (e) {
    print('Invalid date format: ${task.dueDate}');
    dueDate = null;
  }

  return Card(
    elevation: 3,
    margin: EdgeInsets.symmetric(vertical: 8),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(15),
    ),
    color: Colors.white,
    child: ListTile(
      title: Text(
        task.title,
        style: TextStyle(
          decoration: task.status == "Completed" ? TextDecoration.lineThrough : TextDecoration.none,
          color: task.status == "Completed" ? Colors.grey : AppColors.text,
        ),
      ),
      subtitle: Text(
        'Due: ${dueDate != null ? dueDate.toString() : 'Invalid Date'} ${_getTaskStatus(task)}',
        style: TextStyle(color: Colors.grey),
      ),
      trailing: IconButton(
        icon: Icon(Icons.delete, color: AppColors.error),
        onPressed: () {
          context.read<TaskBloc>().add(DeleteTaskEvent(task: task));
        },
      ),
    ),
  );
}

String _getTaskStatus(Task task) {
  if (task.status == "Completed") return "(Completed)";
  return task.isOverdue() ? "(Overdue)" : "(Pending)";
}

}
