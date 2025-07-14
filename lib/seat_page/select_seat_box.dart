import 'package:flutter/material.dart';
import 'seat_index.dart';

class SelectSeatBox extends StatefulWidget {
  @override
  State<SelectSeatBox> createState() => _SelectSeatBoxState();
}

class _SelectSeatBoxState extends State<SelectSeatBox> {
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        seatRowList(context),
        SizedBox(width: 4),
        seatRowList(context),
        SizedBox(width: 4),
        SeatColIndex(),
        SizedBox(width: 4),
        seatRowList(context),
        SizedBox(width: 4),
        seatRowList(context),
      ],
    );
  }

  Column seatRowList(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Column(
      children: [
        seat(context),
        seat(context),
        seat(context),
        seat(context),
        seat(context),
        seat(context),
        seat(context),
        seat(context),
        seat(context),
        seat(context),
        seat(context),
        seat(context),
        seat(context),
        seat(context),
        seat(context),
        seat(context),
        seat(context),
        seat(context),
        seat(context),
        seat(context),

        SizedBox(height: 4),
      ],
    );
  }

  Padding seat(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          color: isDark ? Colors.white38 : Colors.grey[300]!,
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}
