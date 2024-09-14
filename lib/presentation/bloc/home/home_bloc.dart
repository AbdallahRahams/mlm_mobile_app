// home_bloc.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'home_event.dart';
import 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial());

  @override
  Stream<HomeState> mapEventToState(HomeEvent event) async* {
    if (event is LoadHomePageDataEvent) {
      yield HomeLoading();

      try {
        // Fetch home page data from repository or service
        final data = await _fetchHomePageData();
        yield HomeLoaded(data: data);
      } catch (e) {
        yield HomeError(message: 'Failed to load data');
      }
    }
  }

  Future<HomeData> _fetchHomePageData() async {
    // Simulate a network call or data fetching
    await Future.delayed(Duration(seconds: 2));

    // Example data
    return HomeData(
      totalEarnings: 1200.50,
      referralCount: 35,
      currentRank: 'Gold',
      topPerformers: ['User1', 'User2', 'User3'],
      dailyTasks: [
        Task(title: 'Complete profile', isCompleted: false),
        Task(title: 'Share referral link', isCompleted: true),
      ],
      referralLink: 'https://example.com/referral',
      referralQrCode: 'data:image/png;base64,...', // Base64 encoded QR code image
    );
  }
}
