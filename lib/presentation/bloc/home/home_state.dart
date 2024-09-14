// home_state.dart
abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeLoaded extends HomeState {
  final HomeData data;

  HomeLoaded({required this.data});
}

class HomeError extends HomeState {
  final String message;

  HomeError({required this.message});
}

// Define a model class for the HomeData
class HomeData {
  final double totalEarnings;
  final int referralCount;
  final String currentRank;
  final List<String> topPerformers; // Or any other type based on your data
  final List<Task> dailyTasks; // Define Task model as needed
  final String referralLink;
  final String referralQrCode;

  HomeData({
    required this.totalEarnings,
    required this.referralCount,
    required this.currentRank,
    required this.topPerformers,
    required this.dailyTasks,
    required this.referralLink,
    required this.referralQrCode,
  });
}

// Define Task model if needed
class Task {
  final String title;
  final bool isCompleted;

  Task({required this.title, required this.isCompleted});
}
