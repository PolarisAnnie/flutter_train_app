import 'package:flutter/material.dart';

class SeatRowIndex extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        rowIndex("A"),
        SizedBox(width: 4),
        rowIndex("B"),
        SizedBox(width: 4),
        rowIndex(" "),
        SizedBox(width: 4),
        rowIndex("C"),
        SizedBox(width: 4),
        rowIndex("D"),
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
        colIndex(1),
        SizedBox(width: 8),
        colIndex(2),
        SizedBox(width: 8),
        colIndex(3),
        SizedBox(width: 8),
        colIndex(4),
        SizedBox(width: 8),
        colIndex(5),
        SizedBox(width: 8),
        colIndex(6),
        SizedBox(width: 8),
        colIndex(7),
        SizedBox(width: 8),
        colIndex(8),
        SizedBox(width: 8),
        colIndex(9),
        SizedBox(width: 8),
        colIndex(10),
        SizedBox(width: 8),
        colIndex(11),
        SizedBox(width: 8),
        colIndex(12),
        SizedBox(width: 8),
        colIndex(13),
        SizedBox(width: 8),
        colIndex(14),
        SizedBox(width: 8),
        colIndex(15),
        SizedBox(width: 8),
        colIndex(16),
        SizedBox(width: 8),
        colIndex(17),
        SizedBox(width: 8),
        colIndex(18),
        SizedBox(width: 8),
        colIndex(19),
        SizedBox(width: 8),
        colIndex(20),
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
