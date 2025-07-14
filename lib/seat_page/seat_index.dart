import 'package:flutter/material.dart';

class SeatRowIndex extends StatelessWidget {
  List<String> seatRow = ["A", "B", " ", "C", "D"];
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        for (String row in seatRow) ...[
          rowIndex(row),
          if (row != seatRow.last) SizedBox(width: 4),
        ],
      ],
    );
  }

  Container rowIndex(String text) {
    return Container(
      width: 50,
      height: 50,
      alignment: Alignment.bottomCenter,
      child: Text(text, style: TextStyle(fontSize: 18)),
    );
  }
}

class SeatColIndex extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (int i = 1; i <= 20; i++) ...[
          colIndex(i),
          if (i < 20) SizedBox(width: 8),
        ],
      ],
    );
  }
}

Padding colIndex(int num) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 4),
    child: Container(
      width: 50,
      height: 50,
      alignment: Alignment.center,

      child: Text("$num", style: TextStyle(fontSize: 18)),
    ),
  );
}
