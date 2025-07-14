import 'package:flutter/material.dart';
import 'package:flutter_train_app/seat_page/seat_reservation_button.dart';
import 'package:flutter_train_app/seat_page/seat_label.dart';
import 'package:flutter_train_app/seat_page/seat_list.dart';
import 'package:flutter_train_app/seat_page/seat_staion.dart';

// 기차 좌석 선택을 위한 메인 페이지
// 출발역-도착역 정보, 좌석 배치도, 예매 버튼을 포함하는 전체 좌석 선택 화면
class SeatPage extends StatefulWidget {
  final String departure;
  final String arrival;
  SeatPage(this.departure, this.arrival);

  @override
  State<SeatPage> createState() => _SeatPageState();
}

class _SeatPageState extends State<SeatPage> {
  String? selectedCol;
  int? selectedRow;

  void onSeatSelected(String col, int row) {
    setState(() {
      selectedCol = col; // 선택된 열 업데이트
      selectedRow = row; // 선택된 행 업데이트
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("좌석 선택")),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            // 1. 출발역 → 도착역 정보 표시
            SeatStation(widget.departure, widget.arrival),
            // 2. 좌석 상태 범례 (선택됨/선택안됨 표시)
            SeatLabel(),
            // 3. 좌석 배치도 및 선택 영역
            SeatList(selectedCol, selectedRow, onSeatSelected),
            // 4. 예매 하기 버튼
            SeatReservationButton(
              selectedCol,
              selectedRow,
              widget.departure,
              widget.arrival,
            ),
          ],
        ),
      ),
    );
  }
}
