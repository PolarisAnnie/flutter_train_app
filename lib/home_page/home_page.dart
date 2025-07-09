import 'package:flutter/material.dart';
import 'package:flutter_train_app/home_page/search_button.dart';
import 'package:flutter_train_app/home_page/select_station.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      //body background 색상
      backgroundColor: isDark ? Colors.black : Colors.grey[200],
      appBar: AppBar(title: Text("기차 예매")),
      // Scaffold body padding 20
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          //body 내 위젯 세로 가운데 정렬
          mainAxisAlignment: MainAxisAlignment.center,
          children: [SelectStation(), SizedBox(height: 20), SearchButton()],
        ),
      ),
    );
  }
}
