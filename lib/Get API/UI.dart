import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providerapi/Get%20API/provider.dart';
import 'api_services.dart';


import 'Model/getApiModel.dart';
class getApiUi extends StatefulWidget {
  const getApiUi({super.key});

  @override
  State<getApiUi> createState() => _getApiUiState();
}



class _getApiUiState extends State<getApiUi> {

@override
void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<ApiProvider>(context, listen: false).getData();
  }
  @override
  Widget build(BuildContext context) {
  final provider = Provider.of<ApiProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Get API"),
        backgroundColor: Colors.teal,
      ),
      body: provider.isLoading? Center(child: CircularProgressIndicator()):
          ListView.builder(
            itemCount: 1,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(provider.model.title.toString()),

              );

          },)
    );
  }
}
