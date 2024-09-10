import 'package:bloc/bloc.dart';
import 'auth_event.dart';
import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<AuthSignInEvent>((event, emit) {
      // Handle sign-in logic
      emit(AuthLoading());
      // Assume successful login
      emit(AuthSuccess());
    });

    on<AuthSignOutEvent>((event, emit) {
      // Handle sign-out logic
      emit(AuthInitial());
    });
  }
}
