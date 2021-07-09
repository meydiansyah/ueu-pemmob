import 'package:flutter/material.dart';
import 'package:flutter_app/page/home.dart';
import 'package:flutter_app/page/product_list.dart';

void main() {
  runApp(MyApp());
}

final keyProduct = new GlobalKey<ProductPageState>();

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Riski mey',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        accentColor: Colors.grey,
      ),
      home: Home(),
    );
  }
}
