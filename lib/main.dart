import 'package:flutter/material.dart';
import 'package:flutter_train_app/home_page/home_page.dart';
import 'package:flutter_train_app/seat_page/seat_list.dart';
import 'package:flutter_train_app/seat_page/seat_page.dart';
import 'package:flutter_train_app/station_list.dart';
import 'package:flutter_train_app/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.light,
      theme: lightTheme,
      darkTheme: darkTheme,
      home: HomePage(),
    );
  }
}
