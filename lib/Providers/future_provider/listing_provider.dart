import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_practice/data/product_data.dart';

// 1. We specify the type of data this provider will eventually return: <List<Product>>
final marketListingsProvider = FutureProvider<List<Product>>((ref) async {
  // 2. Simulate the time it takes to connect to a database and download data
  await Future.delayed(const Duration(seconds: 2));

  // 3. Return the actual data. This matches the <List<Product>> type we declared.
  return [
    Product(id: 'p1', title: 'Calculus 9th Edition Textbook', price: 2500.0),
    Product(id: 'p2', title: 'Used Mechanical Keyboard', price: 4500.0),
    Product(id: 'p3', title: 'Lab Coat (Size M)', price: 800.0),
  ];
});
