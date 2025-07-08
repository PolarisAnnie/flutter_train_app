import 'package:flutter/material.dart';
import 'package:flutter_train_app/seat_page/sear_reservation_button.dart';
import 'package:flutter_train_app/seat_page/seat_label.dart';
import 'package:flutter_train_app/seat_page/seat_list.dart';
import 'package:flutter_train_app/seat_page/seat_staion.dart';

class SeatPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("좌석 선택")),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
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
