import 'sofa.dart';

class CartItem {
  final Sofa sofa;
  int quantity;

  CartItem({required this.sofa, this.quantity = 1});

  double get total => sofa.price * quantity;
}

class Cart {
  static final Cart _instance = Cart._internal();
  factory Cart() => _instance;
  Cart._internal();

  final List<CartItem> items = [];

  void add(Sofa sofa) {
    final existing = items.where((i) => i.sofa.name == sofa.name);
    if (existing.isNotEmpty) {
      existing.first.quantity++;
    } else {
      items.add(CartItem(sofa: sofa));
    }
  }

  void remove(Sofa sofa) {
    items.removeWhere((i) => i.sofa.name == sofa.name);
  }

  double get grandTotal => items.fold(0, (sum, item) => sum + item.total);

  int get itemCount => items.fold(0, (sum, item) => sum + item.quantity);
}
