import 'package:flutter/material.dart';

// 좌석이 선택되었을 때, 아닐 때의 색상 표시 안내 라벨
class SeatLabel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        selectStatus("선택됨", Colors.purple),
        SizedBox(width: 20),
        // 다크 모드일 때 색상 분기 처리
        selectStatus("선택안됨", isDark ? Colors.white38 : Colors.grey[300]!),
      ],
    );
  }
}

// 선택 여부에 따른 색상 예시 컨테이너
Row selectStatus(String text, Color color) {
  return Row(
    children: [
      Container(
        height: 24,
        width: 24,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      SizedBox(width: 4),
      Text(text),
    ],
  );
}
