import 'package:mobx/mobx.dart';
import 'package:myapp/modals/product_item.dart';

part 'cart_store.g.dart';

class CartStore extends _CartStore with _$CartStore {}

abstract class _CartStore with Store {
  @observable
  ObservableList<ProductItem> cartItems = ObservableList<ProductItem>();
  
  @computed
  int get totalItems => cartItems.length;

  @computed
  double get totalPrice {
    double sum = 0.0;
    for (var item in cartItems) {
      sum += item.price * item.quantity;
    }
    return sum;
  }

  @action
  void addToCart(ProductItem product) {
    final existingProduct = cartItems.firstWhere(
      (item) => item.name == product.name,
      orElse: () => ProductItem(name: '', price: 0),
    );

    if (existingProduct.name.isNotEmpty) {
      existingProduct.quantity++;
    } else {
      cartItems.add(product);
    }
  }

  @action
  void removeFromCart(ProductItem product) {
    cartItems.removeWhere((item) => item.name == product.name);
    product.quantity = 1;
  }
}
