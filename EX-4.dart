enum DeliveryType { pickup, delivery }

class Product {
  final String name;
  final double price;

  Product({required this.name, required this.price});
}

class OrderItem {
  final Product product;
  final int quantity;

  OrderItem({required this.product, required this.quantity});

  double get subtotal => product.price * quantity;
}

class Order {
  final List<OrderItem> items;
  final DeliveryType deliveryType;
  final String? address;

  Order({
    required this.items,
    required this.deliveryType,
    this.address,
  });

  double getTotal() {
    double total = items.fold(0, (sum, item) => sum + item.subtotal);

    if (deliveryType == DeliveryType.delivery) {
      total += 2.5;
    }
    return total;
  }
}

main() {
  Product apple = Product(name: "Apple", price: 0.5);
  Product bread = Product(name: "Bread", price: 1.5);

  OrderItem item1 = OrderItem(product: apple, quantity: 4);
  OrderItem item2 = OrderItem(product: bread, quantity: 2);

  Order order = Order(
    items: [item1, item2],
    deliveryType: DeliveryType.delivery,
    address: "123 Main Street",
  );

  print("Order total: \$${order.getTotal()}");
}