import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_practice/Providers/future_provider/listing_provider.dart';

class WeatherPage extends ConsumerWidget {
  const WeatherPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: const Text("Weather Page")),
      body: Center(
        // We removed the Consumer widget and simply return the result
        // of ref.watch().when() directly to the child property.
        child: ref
            .watch(marketListingsProvider)
            .when(
              data: (products) {
                return ListView.builder(
                  itemCount: products.length,
                  itemBuilder: (context, index) {
                    final product = products[index];
                    return ListTile(
                      leading: const Icon(Icons.inventory_2),
                      title: Text(product.title),
                      subtitle: Text('Rs. ${product.price.toStringAsFixed(2)}'),
                      trailing: const Icon(Icons.chevron_right),
                      onTap: () {
                        print('Tapped on ${product.title}');
                      },
                    );
                  },
                );
              },
              error: (error, stackTrace) {
                return Text(error.toString());
              },
              loading: () {
                return const CircularProgressIndicator();
              },
            ),
      ),
    );
  }
}
