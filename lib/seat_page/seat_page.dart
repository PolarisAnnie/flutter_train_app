import 'package:flutter/material.dart';
import 'package:flutter_train_app/seat_page/seat_reservation_button.dart';
import 'package:flutter_train_app/seat_page/seat_label.dart';
import 'package:flutter_train_app/seat_page/seat_list.dart';
import 'package:flutter_train_app/seat_page/seat_staion.dart';

class SeatPage extends StatefulWidget {
  final String departure;
  final String arrival;
  SeatPage(this.departure, this.arrival);

  @override
  State<SeatPage> createState() => _SeatPageState();
}

class _SeatPageState extends State<SeatPage> {
  String? selectedRow;
  int? selectedCol;

  void onSeatSelected(String row, int col) {
    setState(() {
      selectedRow = row;
      selectedCol = col;
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
            SeatStation(widget.departure, widget.arrival),
            SeatLabel(),
            SeatList(selectedRow, selectedCol, onSeatSelected),
            SeatReservationButton(selectedRow, selectedCol),
          ],
        ),
      ),
    );
  }
}
