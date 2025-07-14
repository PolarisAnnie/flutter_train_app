import 'package:flutter/material.dart';
import 'package:flutter_train_app/seat_page/seat_index.dart';
import 'package:flutter_train_app/seat_page/select_seat_box.dart';

// 좌석 선택을 위한 메인 리스트 위젯
// 열 인덱스(A,B,C,D)와 좌석 선택 박스를 포함하는 스크롤 가능한 영역

class SeatList extends StatelessWidget {
  String? selectedCol;
  int? selectedRow;
  Function(String, int) onSeatSelected; // 좌석 선택 시 호출될 콜백 함수

  SeatList(this.selectedCol, this.selectedRow, this.onSeatSelected);
  @override
  Widget build(BuildContext context) {
    return Expanded(
      // 리스트 뷰 적용
      child: ListView(
        padding: EdgeInsets.symmetric(vertical: 20),
        children: [
          // 좌석의 열 인덱스 위젯
          SeatColIndex(),
          // 좌석 선택 박스 영역
          SelectSeatBox(selectedCol, selectedRow, onSeatSelected),
        ],
      ),
    );
  }
}
