import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'ProviderServices.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    print("hello");
    final products = ref.watch(productProvider);

    return Scaffold(
      appBar: AppBar(title: const Text("Products")),

      body: products.when(
        data: (data) {
          return ListView.builder(
            itemCount: data.length,

            itemBuilder: (context, index) {
              final product = data[index];

              return Card(
                child: ListTile(
                  leading: Image.network(product.image!, width: 50, height: 50),

                  title: Text(product.title!),

                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(product.category!),

                      Text("\$${product.price}"),

                      Text("⭐ ${product.rating?.rate}"),
                    ],
                  ),
                ),
              );
            },
          );
        },

        loading: () => const Center(child: CircularProgressIndicator()),

        error: (error, stackTrace) => Center(child: Text(error.toString())),
      ),
    );
  }
}
