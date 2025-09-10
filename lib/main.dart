import 'package:flutter/material.dart';

import 'screens/fasion_categoris.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Colors.deepOrange,

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrangeAccent),

      ),
      home: FashionCategoriesScreen(),
    );
  }
}




