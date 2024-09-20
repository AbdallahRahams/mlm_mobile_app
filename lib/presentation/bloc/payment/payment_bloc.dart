import 'package:flutter_bloc/flutter_bloc.dart';
import 'payment_event.dart';
import 'payment_state.dart';

class PaymentBloc extends Bloc<PaymentEvent, PaymentState> {
  PaymentBloc() : super(PaymentInitial()) {
    on<LoadPaymentMethods>(_onLoadPaymentMethods);
    on<AddPaymentMethod>(_onAddPaymentMethod);
    on<EditPaymentMethod>(_onEditPaymentMethod);
    on<PaymentErrorEvent>(_onPaymentErrorEvent);  // Update event handler
  }

  void _onLoadPaymentMethods(LoadPaymentMethods event, Emitter<PaymentState> emit) async {
    emit(PaymentLoading());

    try {
      final paymentMethods = await _loadPaymentMethods();
      emit(PaymentLoaded(paymentMethods: paymentMethods));
    } catch (e) {
      emit(PaymentErrorState('Failed to load payment methods'));  // Update state
    }
  }

  void _onAddPaymentMethod(AddPaymentMethod event, Emitter<PaymentState> emit) async {
    try {
      await _addPaymentMethod(event.method);
      final paymentMethods = await _loadPaymentMethods();
      emit(PaymentLoaded(paymentMethods: paymentMethods));
    } catch (e) {
      emit(PaymentErrorState('Failed to add payment method'));  // Update state
    }
  }

  void _onEditPaymentMethod(EditPaymentMethod event, Emitter<PaymentState> emit) async {
    try {
      await _editPaymentMethod(event.method);
      final paymentMethods = await _loadPaymentMethods();
      emit(PaymentLoaded(paymentMethods: paymentMethods));
    } catch (e) {
      emit(PaymentErrorState('Failed to edit payment method'));  // Update state
    }
  }

  void _onPaymentErrorEvent(PaymentErrorEvent event, Emitter<PaymentState> emit) {
    emit(PaymentErrorState(event.message));  // Handle errors
  }

  Future<List<String>> _loadPaymentMethods() async {
    // Implement local data loading logic here
    return [];
  }

  Future<void> _addPaymentMethod(String method) async {
    // Implement local data addition logic here
  }

  Future<void> _editPaymentMethod(String method) async {
    // Implement local data editing logic here
  }
}
