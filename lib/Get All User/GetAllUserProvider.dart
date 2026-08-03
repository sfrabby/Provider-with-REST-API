import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../Add Product/AddProvider.dart';
import 'GetUserModel.dart';

final apiProvider = Provider<ApiServices>((ref) {
  return ApiServices();
});

final userProvider =
FutureProvider<List<GetUserModel>>((ref) async {
  return ref.read(apiProvider).getUsers();
});