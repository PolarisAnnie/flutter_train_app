import 'package:flutter/material.dart';

class StationList extends StatelessWidget {
  String stationName;
  bool isDeparture;

  StationList(this.isDeparture, this.stationName);

  @override
  Widget build(BuildContext context) {
    List<String> stationList = [
      "수서",
      "동탄",
      "평택지제",
      "천안아산",
      "오송",
      "대전",
      "김천구미",
      "동대구",
      "경주",
      "울산",
      "부산",
    ];

    List<String> filteredStation() {
      if (stationName == "선택") {
        return stationList;
      }
      return stationList.where((station) => station != stationName).toList();
    }

    return Scaffold(
      appBar: AppBar(title: isDeparture ? Text("출발역") : Text("도착역")),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            for (int i = 0; i < filteredStation().length; i++)
              stationItem(context, filteredStation()[i]),
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
