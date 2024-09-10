import 'package:bloc/bloc.dart';
import 'order_event.dart';
import 'order_state.dart';

class OrderBloc extends Bloc<OrderEvent, OrderState> {
  OrderBloc() : super(OrderInitial()) {
    on<FetchOrdersEvent>((event, emit) {
      emit(OrderLoading());
      // Fetch orders logic
      emit(OrderLoaded(orderId: event.userId));
    });
  }
}
