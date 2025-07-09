import 'package:flutter/material.dart';
import 'seat_index.dart';

class SelectSeatBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        seatRowList(),
        SizedBox(width: 4),
        seatRowList(),
        SizedBox(width: 4),
        SeatColIndex(),
        SizedBox(width: 4),
        seatRowList(),
        SizedBox(width: 4),
        seatRowList(),
      ],
    );
  }

  Column seatRowList() {
    return Column(
      children: [
        seat(),
        seat(),
        seat(),
        seat(),
        seat(),
        seat(),
        seat(),
        seat(),
        seat(),
        seat(),
        seat(),
        seat(),
        seat(),
        seat(),
        seat(),
        seat(),
        seat(),
        seat(),
        seat(),
        seat(),

        SizedBox(height: 4),
      ],
    );
  }

  Padding seat() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          color: Colors.grey[300]!,
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}
