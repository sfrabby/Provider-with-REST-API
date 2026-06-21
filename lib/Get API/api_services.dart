import 'dart:developer';

import 'package:http/http.dart' as http;
import 'dart:convert'; // jsonDecode ব্যবহার করার জন্য এটি লাগবে
import 'Model/getApiModel.dart';

class ApiServices {
  bool isLoading = true;
  Future<getApiModel> getApi() async {
    late getApiModel model;

    final url = Uri.parse("https://api.escuelajs.co/api/v1/products");

    final response = await http.get(url);
    if(response.statusCode == 200){
      model = getApiModel.fromJson(jsonDecode(response.body));
    }
    else{
      log(response.body);
    }
    return model;

  }
}
