import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:myapp/store/cart_store.dart';
import 'package:myapp/home_screen/widgets/cart.dart';
import 'package:myapp/home_screen/widgets/list_product.dart';
import 'package:myapp/modals/product_item.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cartStore = CartStore();
    final products = productItems;

    return Scaffold(
      appBar: AppBar(
        title: const Text('MobX demo'),
        centerTitle: true,
        actions: [
          Observer(
            builder: (_) => IconButton(
              icon: Stack(
                children: [
                  const Icon(Icons.shopping_cart),
                  if (cartStore.totalItems > 0)
                    Positioned(
                      right: 0,
                      child: CircleAvatar(
                        radius: 8,
                        child: Text('${cartStore.totalItems}'),
                      ),
                    ),
                ],
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) => CartPage(cartStore: cartStore)),
                );
              },
            ),
          ),
        ],
      ),
      body: ListProduct(products: products, cartStore: cartStore,)
    );
  }
}
