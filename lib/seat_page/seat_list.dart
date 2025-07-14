import 'package:flutter/material.dart';
import 'package:flutter_train_app/seat_page/seat_index.dart';
import 'package:flutter_train_app/seat_page/select_seat_box.dart';

class SeatList extends StatelessWidget {
  String? selectedRow;
  int? selectedCol;
  SeatList(this.selectedRow, this.selectedCol);
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        padding: EdgeInsets.symmetric(vertical: 20),
        children: [SeatRowIndex(), SelectSeatBox()],
      ),
    );
  }
}
