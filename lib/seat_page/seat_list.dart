import 'package:flutter/material.dart';
import 'package:flutter_train_app/seat_page/seat_index.dart';
import 'package:flutter_train_app/seat_page/seat_widget.dart.dart';

class SeatList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: ListView(children: [SeatRowIndex(), SelectSeatBox()]),
      ),
    );
  }
}
