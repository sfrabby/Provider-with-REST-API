import 'dart:convert';

import 'package:http/http.dart' as http;

import 'model.dart';

class ApiServices {

  Future<AddProductModel> addProduct({
    required String title,
    required double price,
    required String description,
    required String image,
    required String category,
  }) async {

    final response = await http.post(
      Uri.parse("https://fakestoreapi.com/products"),

      headers: {
        "Content-Type": "application/json",
      },

      body: jsonEncode({

        "title": title,
        "price": price,
        "description": description,
        "image": image,
        "category": category,

      }),
    );

    if (response.statusCode == 200 || response.statusCode == 201) {

      final data = jsonDecode(response.body);

      return AddProductModel.fromJson(data);

    } else {

      throw Exception("Failed to Add Product");

    }
  }
}