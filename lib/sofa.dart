class Sofa {
  final String name;
  final double price;
  final String emoji;

  const Sofa({required this.name, required this.price, required this.emoji});
}

final List<Sofa> sofaMenu = [
  const Sofa(name: '2-Seater Sofa', price: 299.0, emoji: '🛋️'),
  const Sofa(name: '3-Seater Sofa', price: 399.0, emoji: '🛋️'),
  const Sofa(name: 'Recliner Sofa', price: 449.0, emoji: '🪑'),
  const Sofa(name: 'L-Shape Sofa', price: 599.0, emoji: '🛋️'),
  const Sofa(name: 'Sofa Bed', price: 349.0, emoji: '🛏️'),
  const Sofa(name: 'Armchair', price: 199.0, emoji: '🪑'),
];
