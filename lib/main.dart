import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Get API/UI.dart';

void main() {
  runApp(MultiProvider(
      
      providers: [
        ChangeNotifierProvider(create: (context) => ,)
      ],
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: getApiUi());
  }
}
