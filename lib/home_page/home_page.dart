import 'package:flutter/material.dart';
import 'package:flutter_train_app/home_page/search_button.dart';
import 'package:flutter_train_app/home_page/select_station.dart';

// 기차 예매 정보 클래스 추가
class TrainReservation {
  // 출발역, 목적역 초기 상태를 선택으로 둠
  String? departure = "선택";
  String? arrival = "선택";
  String? seatRow;
  int? seatCol;

  TrainReservation(this.departure, this.arrival, this.seatRow, this.seatCol);
}

// 출발역, 도착역 정보가 모두 들어가 있는지 확인하는 변수 추가
bool isSlectedStation = false;

// StatefulWidget으로 변경
class HomePage extends StatefulWidget {
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TrainReservation? reservation;
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
