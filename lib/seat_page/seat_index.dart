import 'package:flutter/material.dart';

// 좌석 배치도의 행 인덱스를 표시하는 위젯
class SeatColIndex extends StatelessWidget {
  List<String> seatCol = ["A", "B", " ", "C", "D"];
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // 각 라벨을 순회하며 인덱스 생성
        for (String col in seatCol) ...[
          colIndex(col),
          // 마지막 요소가 아닌 경우에만 간격 추가
          if (col != seatCol.last) SizedBox(width: 4),
        ],
      ],
    );
  }

  // 열 라벨을 표시하는 컨테이너 위젯
  Container colIndex(String text) {
    return Container(
      width: 50,
      height: 50,
      alignment: Alignment.bottomCenter,
      child: Text(text, style: TextStyle(fontSize: 18)),
    );
  }
}

// 좌석 배치도의 열 인덱스를 표시하는 위젯
class SeatRowIndex extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // 1부터 20까지 순회하며 아이템 생성
        for (int i = 1; i <= 20; i++) ...[
          rowIndex(i),
          if (i < 20) SizedBox(width: 4),
        ],
      ],
    );
  }
}

// 행 라벨을 표시하는 컨테이너 위젯
Padding rowIndex(int num) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 4),
    child: Container(
      width: 50,
      height: 50,
      alignment: Alignment.center,

      child: Text("$num", style: TextStyle(fontSize: 18)),
    ),
  );
}
