import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'ApiServicess2.dart';
import 'singleProductModel.dart';

final singleProvider = Provider<ApiServices2>((ref) {
  return ApiServices2();
});

final singleProductProvider =
FutureProvider<SingleProductModel>((ref) async {
  return ref.read(singleProvider).getSingleProduct();
});