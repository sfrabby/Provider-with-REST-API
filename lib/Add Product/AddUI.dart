import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'provider.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  final titleController = TextEditingController();
  final priceController = TextEditingController();
  final descriptionController = TextEditingController();
  final imageController = TextEditingController();
  final categoryController = TextEditingController();

  bool submit = false;

  @override
  Widget build(BuildContext context) {
    final product = submit
        ? ref.watch(
      addProductProvider({
        "title": titleController.text,
        "price": double.parse(priceController.text),
        "description": descriptionController.text,
        "image": imageController.text,
        "category": categoryController.text,
      }),
    )
        : null;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Product"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextField(
                controller: titleController,
                decoration: const InputDecoration(
                  labelText: "Title",
                ),
              ),

              const SizedBox(height: 10),

              TextField(
                controller: priceController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: "Price",
                ),
              ),

              const SizedBox(height: 10),

              TextField(
                controller: descriptionController,
                decoration: const InputDecoration(
                  labelText: "Description",
                ),
              ),

              const SizedBox(height: 10),

              TextField(
                controller: imageController,
                decoration: const InputDecoration(
                  labelText: "Image URL",
                ),
              ),

              const SizedBox(height: 10),

              TextField(
                controller: categoryController,
                decoration: const InputDecoration(
                  labelText: "Category",
                ),
              ),

              const SizedBox(height: 20),

              ElevatedButton(
                onPressed: () {
                  setState(() {
                    submit = true;
                  });
                },
                child: const Text("Add Product"),
              ),

              const SizedBox(height: 30),

              if (submit)
                product!.when(
                  data: (data) {
                    return Card(
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          children: [
                            Text(
                              data.title ?? "",
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text("Price : \$${data.price}"),
                            Text(data.category ?? ""),
                            Text(data.description ?? ""),
                          ],
                        ),
                      ),
                    );
                  },
                  loading: () =>
                  const CircularProgressIndicator(),
                  error: (e, s) => Text(e.toString()),
                ),
            ],
          ),
        ),
      ),
    );
  }
}