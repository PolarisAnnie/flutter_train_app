import 'package:flutter/material.dart';

class SeatLabel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        selectStatus("선택됨", Colors.purple),
        SizedBox(width: 20),
        selectStatus("선택안됨", Colors.grey[300]!),
      ],
    );
  }
}

Row selectStatus(String text, Color color) {
  return Row(
    children: [
      Container(
        height: 24,
        width: 24,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      SizedBox(width: 4),
      Text(text),
    ],
  );
}
