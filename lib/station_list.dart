import 'package:flutter/material.dart';
import 'package:flutter_train_app/home_page/select_station.dart';

class StationList extends StatelessWidget {
  String stationName;
  bool isDeparture;

  StationList(this.isDeparture, this.stationName);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: isDeparture ? Text("출발역") : Text("도착역")),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            stationItem(context, "수서"),
            stationItem(context, "동탄"),
            stationItem(context, "평택지제"),
            stationItem(context, "천안아산"),
            stationItem(context, "오송"),
            stationItem(context, "대전"),
            stationItem(context, "김천구미"),
            stationItem(context, "동대구"),
            stationItem(context, "경주"),
            stationItem(context, "울산"),
            stationItem(context, "부산"),
          ],
        ),
      ),
    );
  }

  //반복되는 역 이름 부분 함수화
  GestureDetector stationItem(BuildContext context, String stationName) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context, stationName);
      },

      child: Container(
        height: 50,
        width: double.infinity,
        //컨테이너 하단 색상 부여하는 방법
        decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.grey[300]!)),
        ),
        //텍스트가 컨테이너의 가운데에 오도록 패딩 적용
        child: Padding(
          padding: const EdgeInsets.all(12.5),
          // 텍스트 스타일 설정
          child: Text(
            stationName,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
