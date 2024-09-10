abstract class ProductEvent {}

class FetchProductsEvent extends ProductEvent {
  final String productId;

  FetchProductsEvent(this.productId);
}
