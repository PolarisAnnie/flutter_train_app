import 'package:flutter/material.dart';

class SeatStation extends StatelessWidget {
  String departure;
  String arrival;
  SeatStation(this.departure, this.arrival);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        selectedStation(departure),
        Icon(Icons.arrow_circle_right_outlined, size: 30),
        selectedStation(arrival),
      ],
    );
  }

  // 반복되는 부분 함수화
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
