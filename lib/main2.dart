// main.dart
import 'package:flutter/material.dart';
import 'foodmenu.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Food Menu App',
      theme: ThemeData(
        primarySwatch: const Color.fromARGB(255, 0, 0, 0),
      ),
      home: FoodMenu(), // เรียกใช้ FoodMenu ที่สร้างขึ้น
    );
  }
}
