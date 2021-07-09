import 'package:flutter/material.dart';
import 'package:flutter_app/page/home.dart';
import 'package:flutter_app/page/localization/helper_localization.dart';
import 'package:flutter_app/page/product_list.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

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
      localizationsDelegates: [
        const CustomLocalizationsDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('en', ''),
        const Locale('es', ''),
      ],
      theme: ThemeData(
        accentColor: Colors.grey,
      ),
      home: Home(),
    );
  }
}
