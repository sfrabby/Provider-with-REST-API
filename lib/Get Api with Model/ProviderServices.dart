import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'ApiModel.dart';
import 'ApiServices.dart';

final apiProvider = Provider<ApiService>((ref) {
  return ApiService();
});

final productProvider =
FutureProvider<List<GetProductModel>>((ref) async {
  return ref.read(apiProvider).getProducts();
});