import 'package:bloc/bloc.dart';
import 'user_event.dart';
import 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(UserInitial()) {
    on<GetUserInfoEvent>((event, emit) async {
      emit(UserLoading());
      try {
        // Fetch user info based on event.userId
        // Assuming success for now
        emit(UserLoaded(userId: event.userId));
      } catch (e) {
        emit(UserError("Failed to load user information"));
      }
    });
  }
}
