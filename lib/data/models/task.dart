class Task {
  final String title;
  final String dueDate;
  final String status;
  final int hours; // New field for task hours

  Task({
    required this.title,
    required this.dueDate,
    required this.status,
    required this.hours,
  });

  // Convert Task to Map for storage
  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'dueDate': dueDate,
      'status': status,
      'hours': hours, 
    };
  }

  // Convert Map to Task for retrieval
  factory Task.fromMap(Map<String, dynamic> map) {
    return Task(
      title: map['title'] ?? '',
      dueDate: map['dueDate'] ?? '',
      status: map['status'] ?? 'Pending',
      hours: map['hours'] ?? 0, 
    );
  }

  // Function to check if the task is overdue
  bool isOverdue() {
    DateTime currentDate = DateTime.now();
    DateTime taskDate = DateTime.parse(dueDate);

    if (taskDate.isBefore(currentDate)) {
      return true;
    } else if (taskDate.isAtSameMomentAs(currentDate)) {
      final int currentMinutes = currentDate.hour * 60 + currentDate.minute;
      return currentMinutes > hours;  // Task overdue if current time exceeds task hours
    }
    return false;  // Not overdue if in the future
  }
}

// Define an extension for the Task model
extension TaskStatusExtension on Task {
  String getTaskStatus() {
    if (status == "Completed") {
      return "(Completed)";
    }
    if (isOverdue()) {
      return "(Overdue)";
    }
    return "(Pending)";
  }

  bool isOverdue() {
    DateTime? dueDate;
    try {
      dueDate = DateTime.parse(this.dueDate);
    } catch (e) {
      return false;
    }
    return DateTime.now().isAfter(dueDate);
  }
}
