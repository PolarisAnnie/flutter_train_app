import 'package:flutter/material.dart';

// 기차역을 선택할 수 있는 리스트 화면
class StationList extends StatelessWidget {
  String stationName;
  bool isDeparture;

  StationList(this.isDeparture, this.stationName);

  @override
  Widget build(BuildContext context) {
    // 전체 기차역 목록
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

    // 선택 가능한 역을 반환하는 메서드
    // 이미 선택된 반대편 역은 목록에서 필터링됨
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
            // 필터링된 역 목록 순회하며 각 역 아이템 생성
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
        // 역 선택 시, 선택된 역 이름과 함께 이전 화면으로 돌아가기
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
