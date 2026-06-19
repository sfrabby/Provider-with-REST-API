import 'package:flutter/material.dart';

class getApiUi extends StatefulWidget {
  const getApiUi({super.key});

  @override
  State<getApiUi> createState() => _getApiUiState();
}

class _getApiUiState extends State<getApiUi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Get API"),
        backgroundColor: Colors.teal,

      ),
    );
  }
}
