import 'package:flutter/material.dart';
import 'package:flutter_train_app/home_page/search_button.dart';
import 'package:flutter_train_app/home_page/select_station.dart';

// 기차앱 예매 첫 화면 : 출발역과 도착역 목록 확인 및 선택 가능
class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // 초기값을 선택으로 설정
  String departure = "선택";
  String arrival = "선택";

  // 역 선택 시 상태를 업데이트하는 콜백 함수
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
      // 배경색 : 다크모드에는 검정, 라이트 모드일 때는 연한 회색
      backgroundColor: isDark ? Colors.black : Colors.grey[200],
      appBar: AppBar(title: Text("기차 예매")),

      // 좌우 패딩 20px
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          //세로 방향 가운데 정렬
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // 출발역, 도착역 선택 위젯
            SelectStation(
              departure: departure,
              arrival: arrival,
              onUpdate: updateStation,
            ),

            SizedBox(height: 20),

            // 검색 버튼 위젯
            SearchButton(departure: departure, arrival: arrival),
          ],
        ),
      ),
    );
  }
}
