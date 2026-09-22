import 'package:flutter/material.dart';
import '../models/sofa.dart';
import '../models/cart.dart';
import 'cart_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final cart = Cart();

  void _addToCart(Sofa sofa) {
    setState(() => cart.add(sofa));
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('${sofa.name} added to cart'), duration: const Duration(seconds: 1)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('🛋️ Cozy Sofa Store'),
        actions: [
          Stack(
            alignment: Alignment.center,
            children: [
              IconButton(
                icon: const Icon(Icons.shopping_cart),
                onPressed: () async {
                  await Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const CartPage()),
                  );
                  setState(() {});
                },
              ),
              if (cart.itemCount > 0)
                Positioned(
                  right: 6,
                  top: 6,
                  child: CircleAvatar(
                    radius: 9,
                    backgroundColor: Colors.red,
                    child: Text(
                      '${cart.itemCount}',
                      style: const TextStyle(fontSize: 11, color: Colors.white),
                    ),
                  ),
                ),
            ],
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(12),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          childAspectRatio: 0.75,
        ),
        itemCount: sofaMenu.length,
        itemBuilder: (context, index) {
          final sofa = sofaMenu[index];
          return Card(
            elevation: 3,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(sofa.emoji, style: const TextStyle(fontSize: 50)),
                const SizedBox(height: 8),
                Text(sofa.name, style: const TextStyle(fontWeight: FontWeight.bold)),
                const SizedBox(height: 4),
                Text('\$${sofa.price.toStringAsFixed(2)}',
                    style: const TextStyle(color: Colors.brown)),
                const SizedBox(height: 8),
                ElevatedButton(
                  onPressed: () => _addToCart(sofa),
                  child: const Text('Add to Cart'),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
