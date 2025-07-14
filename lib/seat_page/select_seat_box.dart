import 'package:flutter/material.dart';
import 'seat_index.dart';

// 좌석 선택을 위한 메인 박스 위젯
class SelectSeatBox extends StatefulWidget {
  String? selectedCol;
  int? selectedRow;
  Function(String, int) onSeatSelected; // 좌석 선택 시 호출되는 콜백 함수
  SelectSeatBox(this.selectedCol, this.selectedRow, this.onSeatSelected);

  @override
  State<SelectSeatBox> createState() => _SelectSeatBoxState();
}

class _SelectSeatBoxState extends State<SelectSeatBox> {
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // A, B열 , 행 번호 인덱스, C,D열
        seatColList(context, "A", widget.onSeatSelected),
        SizedBox(width: 4),
        seatColList(context, "B", widget.onSeatSelected),
        SizedBox(width: 4),
        SeatRowIndex(),
        SizedBox(width: 4),
        seatColList(context, "C", widget.onSeatSelected),
        SizedBox(width: 4),
        seatColList(context, "D", widget.onSeatSelected),
      ],
    );
  }

  //  1행부터 20행까지 좌석을 세로로 배치
  Column seatColList(
    BuildContext context,
    String rowIndex,
    Function onSeatSelected,
  ) {
    return Column(
      children: [
        for (int i = 1; i <= 20; i++)
          seat(context, rowIndex, i, widget.onSeatSelected),
        SizedBox(height: 4),
      ],
    );
  }

  // 개별 좌석을 생성하는 메서드
  Padding seat(
    BuildContext context,
    String colIndex,
    int rowNum,
    Function onSeatSelected,
  ) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: GestureDetector(
        onTap: () {
          onSeatSelected(colIndex, rowNum);
        },
        child: Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            color:
                // 좌석이 선택되었을 때 보라, 아닐 때는 다크 모드에 따라 분기 처리
                (widget.selectedCol == colIndex && widget.selectedRow == rowNum)
                ? Colors.purple
                : (isDark ? Colors.white38 : Colors.grey[300]!),
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
    );
  }
}
