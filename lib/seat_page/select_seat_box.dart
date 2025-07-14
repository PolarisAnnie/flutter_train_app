import 'package:flutter/material.dart';
import 'seat_index.dart';

class SelectSeatBox extends StatefulWidget {
  Function(String, int) onSeatSelected;
  SelectSeatBox(this.onSeatSelected);

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
        seatRowList(context, "A", widget.onSeatSelected),
        SizedBox(width: 4),
        seatRowList(context, "B", widget.onSeatSelected),
        SizedBox(width: 4),
        SeatColIndex(),
        SizedBox(width: 4),
        seatRowList(context, "C", widget.onSeatSelected),
        SizedBox(width: 4),
        seatRowList(context, "D", widget.onSeatSelected),
      ],
    );
  }

  Column seatRowList(
    BuildContext context,
    String rowIndex,
    Function onSeatSelected,
  ) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Column(
      children: [
        seat(context, rowIndex, 1, widget.onSeatSelected),
        seat(context, rowIndex, 2, widget.onSeatSelected),
        seat(context, rowIndex, 3, widget.onSeatSelected),
        seat(context, rowIndex, 4, widget.onSeatSelected),
        seat(context, rowIndex, 5, widget.onSeatSelected),
        seat(context, rowIndex, 6, widget.onSeatSelected),
        seat(context, rowIndex, 7, widget.onSeatSelected),
        seat(context, rowIndex, 8, widget.onSeatSelected),
        seat(context, rowIndex, 9, widget.onSeatSelected),
        seat(context, rowIndex, 10, widget.onSeatSelected),
        seat(context, rowIndex, 11, widget.onSeatSelected),
        seat(context, rowIndex, 12, widget.onSeatSelected),
        seat(context, rowIndex, 13, widget.onSeatSelected),
        seat(context, rowIndex, 14, widget.onSeatSelected),
        seat(context, rowIndex, 15, widget.onSeatSelected),
        seat(context, rowIndex, 16, widget.onSeatSelected),
        seat(context, rowIndex, 17, widget.onSeatSelected),
        seat(context, rowIndex, 18, widget.onSeatSelected),
        seat(context, rowIndex, 19, widget.onSeatSelected),
        seat(context, rowIndex, 20, widget.onSeatSelected),

        SizedBox(height: 4),
      ],
    );
  }

  Padding seat(
    BuildContext context,
    String rowIndex,
    int colNum,
    Function onSeatSelected,
  ) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: GestureDetector(
        onTap: () {
          print("클릭된 좌석: $rowIndex$colNum");
          onSeatSelected(rowIndex, colNum);
        },
        child: Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            color: isDark ? Colors.white38 : Colors.grey[300]!,
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
    );
  }
}
