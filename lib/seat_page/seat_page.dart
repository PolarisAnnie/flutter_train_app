import 'package:flutter/material.dart';
import 'package:flutter_train_app/seat_page/seat_reservation_button.dart';
import 'package:flutter_train_app/seat_page/seat_label.dart';
import 'package:flutter_train_app/seat_page/seat_list.dart';
import 'package:flutter_train_app/seat_page/seat_index.dart';
import 'package:flutter_train_app/seat_page/seat_staion.dart';

class SeatPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Scaffold(
        appBar: AppBar(title: Text("좌석 선택")),
        body: Column(
          children: [
            SeatStation(),
            SeatLabel(),
            SeatList(),
            SeatReservationButton(),
          ],
        ),
      ),
    );
  }
}
