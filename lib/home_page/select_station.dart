import 'package:flutter/material.dart';

class SelectStation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      // 출발역, 도착역 감싸고 있는 박스 스타일 적용
      height: 200,
      width: double.infinity,
      decoration: BoxDecoration(
        color: isDark ? Colors.white24 : Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          StationSelector("출발역"),
          //세로선 스타일 적용
          Container(
            width: 2,
            height: 50,
            decoration: BoxDecoration(color: Colors.grey[400]),
          ),
          StationSelector("도착역"),
        ],
      ),
    );
  }
}

class StationSelector extends StatelessWidget {
  StationSelector(this.status);
  String status;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        stationStatus(status),
        Text("선택", style: TextStyle(fontSize: 40)),
      ],
    );
  }

  // 중복되는 부분 함수화
  Text stationStatus(String text) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 16,
        color: Colors.grey,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
