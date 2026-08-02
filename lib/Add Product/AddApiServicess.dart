import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'AddProvider.dart';
import 'model.dart';

final apiProvider = Provider<ApiServices>((ref) {
  return ApiServices();
});

final addProductProvider =
FutureProvider.family<AddProductModel, Map<String, dynamic>>(
      (ref, product) async {

    return ref.read(apiProvider).addProduct(
      title: product["title"],
      price: product["price"],
      description: product["description"],
      image: product["image"],
      category: product["category"],
    );

  },
);