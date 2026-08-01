import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:providerwithp/Single Product Model/singleProductModel.dart';

class ApiServices2 {
  Future<SingleProductModel> getSingleProduct() async {
    final response = await http.get(
      Uri.parse("https://fakestoreapi.com/products/1"),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);

      return SingleProductModel.fromJson(data);
    } else {
      throw Exception("Failed to load Product");
    }
  }
}
