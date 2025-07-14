import 'package:flutter/material.dart';

// 좌석 선택 페이지에서 출발역과 도착역 정보를 표시하는 위젯
class SeatStation extends StatelessWidget {
  String departure;
  String arrival;
  SeatStation(this.departure, this.arrival);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        selectedStation(departure), // 출발역 표시
        Icon(Icons.arrow_circle_right_outlined, size: 30),
        selectedStation(arrival), // 도착역 표시
      ],
    );
  }

  // 역 이름을 표시하는 텍스트 위젯을 생성하는 메서드
  Text selectedStation(String station) {
    return Text(
      station,
      style: TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.bold,
        color: Colors.purple,
      ),
    );
  }
}
