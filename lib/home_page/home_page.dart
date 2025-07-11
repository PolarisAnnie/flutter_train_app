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

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TrainReservation? reservation;
  String departure = "선택";
  String arrival = "선택";

  void updateStation(bool isDeparture, String stationName) {
    setState(() {
      if (isDeparture) {
        departure = stationName;
      } else {
        arrival = stationName;
      }
    });
  }

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
          children: [
            SelectStation(
              departure: departure,
              arrival: arrival,
              onUpdate: updateStation,
            ),
            SizedBox(height: 20),
            SearchButton(departure: departure, arrival: arrival),
          ],
        ),
      ),
    );
  }
}
