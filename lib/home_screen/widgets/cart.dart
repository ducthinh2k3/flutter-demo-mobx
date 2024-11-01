import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:myapp/store/cart_store.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key, required this.cartStore});
  final CartStore cartStore;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Cart'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Observer(
              builder: (_) => ListView.builder(
                itemCount: cartStore.cartItems.length,
                itemBuilder: (context, index) {
                  final item = cartStore.cartItems[index];
                  return ListTile(
                    title: Text(item.name),
                    subtitle: Text('${item.price} \$ x ${item.quantity}'),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () {
                        cartStore.removeFromCart(item);
                      },
                    ),
                  );
                },
              ),
            ),
          ),
          Observer(
            builder: (_) => Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Total Price: ${cartStore.totalPrice.toStringAsFixed(2)} \$',
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
