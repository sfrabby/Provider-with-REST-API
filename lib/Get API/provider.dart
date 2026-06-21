import 'package:flutter/widgets.dart';

import 'Model/getApiModel.dart';
import 'api_services.dart';

class ApiProvider with ChangeNotifier{
  late getApiModel model;
  bool isLoading = true;

  getData()async{
    isLoading = true;
    model = await ApiServices().getApi();
    isLoading = false;
    notifyListeners();
  }
}