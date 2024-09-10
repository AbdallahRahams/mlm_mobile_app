import 'package:bloc/bloc.dart';
import 'product_event.dart';
import 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductBloc() : super(ProductInitial()) {
    on<FetchProductsEvent>((event, emit) {
      emit(ProductLoading());
      // Fetch product logic
      emit(ProductLoaded(productId: event.productId));
    });
  }
}
