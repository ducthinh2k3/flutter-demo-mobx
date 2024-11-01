import 'package:flutter/material.dart';
import 'package:myapp/store/cart_store.dart';
import 'package:myapp/modals/product_item.dart';

class ListProduct extends StatelessWidget {
  const ListProduct(
      {super.key, required this.products, required this.cartStore});
  final List<ProductItem> products;
  final CartStore cartStore;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return Card(
            child: ListTile(
              // leading: Text(product.name),
              title: Text(product.name),
              subtitle: Text('${product.price} \$'),
              trailing: IconButton(
                icon: const Icon(Icons.add_shopping_cart),
                onPressed: () {
                  cartStore.addToCart(product);
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
