import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import '../../../data/models/task.dart';
part 'task_state.dart';
part 'task_event.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  TaskBloc() : super(TaskInitial()) {
    on<LoadTasksEvent>(_onLoadTasks);
    on<AddTaskEvent>(_onAddTask);
    on<UpdateTaskEvent>(_onUpdateTask);
    on<DeleteTaskEvent>(_onDeleteTask);
  }

  Future<void> _onLoadTasks(LoadTasksEvent event, Emitter<TaskState> emit) async {
  final prefs = await SharedPreferences.getInstance();
  final String? tasksString = prefs.getString('tasks');
  
  print('Tasks string from SharedPreferences: $tasksString'); // Debug log

  if (tasksString != null) {
    List<dynamic> decoded = jsonDecode(tasksString);
    List<Task> tasks = decoded.map((task) => Task.fromMap(task)).toList();
    print('Decoded tasks: $tasks'); // Debug log
    emit(TasksLoaded(tasks: tasks));
  } else {
    print('No tasks found, emitting empty state'); // Debug log
    emit(TasksLoaded(tasks: []));
  }
}


  Future<void> _onAddTask(AddTaskEvent event, Emitter<TaskState> emit) async {
    if (state is TasksLoaded) {
      final List<Task> updatedTasks = List.from((state as TasksLoaded).tasks)..add(event.task);
      await _saveTasksToLocal(updatedTasks);
      emit(TasksLoaded(tasks: updatedTasks));
    }
  }

  Future<void> _onUpdateTask(UpdateTaskEvent event, Emitter<TaskState> emit) async {
    if (state is TasksLoaded) {
      final List<Task> updatedTasks = (state as TasksLoaded)
          .tasks
          .map((task) => task.title == event.task.title ? event.task : task)
          .toList();
      await _saveTasksToLocal(updatedTasks);
      emit(TasksLoaded(tasks: updatedTasks));
    }
  }

  Future<void> _onDeleteTask(DeleteTaskEvent event, Emitter<TaskState> emit) async {
    if (state is TasksLoaded) {
      final List<Task> updatedTasks = List.from((state as TasksLoaded).tasks)
        ..removeWhere((task) => task.title == event.task.title);
      await _saveTasksToLocal(updatedTasks);
      emit(TasksLoaded(tasks: updatedTasks));
    }
  }

  Future<void> _saveTasksToLocal(List<Task> tasks) async {
    final prefs = await SharedPreferences.getInstance();
    final String tasksString = jsonEncode(tasks.map((task) => task.toMap()).toList());
    prefs.setString('tasks', tasksString);
  }
}
