import 'package:flutter/material.dart';

class SeatStation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        selectedStation("수서"),
        Icon(Icons.arrow_circle_right_outlined, size: 30),
        selectedStation("부산"),
      ],
    );
  }

  Text selectedStation(String station) {
    return Text(
      station,
      style: TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.bold,
        color: Colors.purple,
      ),
    );
  }
}
