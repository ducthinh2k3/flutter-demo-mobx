class ProductItem {
  final String name;
  final double price;
  int quantity;

  ProductItem({
    required this.name,
    required this.price,
    this.quantity = 1,
  });
}

var productItems = [
  ProductItem(
    price: 67.5,
    name: 'Check Shirt for Men',
  ),
  ProductItem(
    price: 45.00,
    name: 'Casual Jacket',
  ),
  ProductItem(
    price: 20.45,
    name: 'Pair of Socks',
  ),
  ProductItem(
    price: 40.00,
    name: 'Trouser for women',
  ),
  ProductItem(
    price: 30.00,
    name: 'School shoes for kids',
  ),
];
