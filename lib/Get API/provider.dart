import 'package:flutter/widgets.dart';
import 'package:providerapi/Get%20API/Model/getApiModel.dart';
import 'package:providerapi/Get%20API/api_services.dart';

class ApiProvider with ChangeNotifier{
  late getApiModel model;
  bool isLoading = true;

  getData()async{
    model = await ApiServices().getApi();
    isLoading = false;
    notifyListeners();
  }
}