import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'SimgleProvider.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final product = ref.watch(singleProductProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Single Product"),
      ),

      body: product.when(

        data: (data) {
          return Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [

                Image.network(
                  data.image!,
                  height: 200,
                ),

                const SizedBox(height: 20),

                Text(
                  data.title!,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                Text("\$${data.price}"),

                Text(data.category!),

                Text(data.description!),

                Text("⭐ ${data.rating?.rate}"),

              ],
            ),
          );
        },

        loading: () =>
        const Center(
          child: CircularProgressIndicator(),
        ),

        error: (e, s) =>
            Center(
              child: Text(e.toString()),
            ),
      ),
    );
  }
}