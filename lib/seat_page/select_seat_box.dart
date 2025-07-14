import 'package:flutter/material.dart';
import 'seat_index.dart';

class SelectSeatBox extends StatefulWidget {
  String? selectedRow;
  int? selectedCol;
  Function(String, int) onSeatSelected;
  SelectSeatBox(this.selectedRow, this.selectedCol, this.onSeatSelected);

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
    return Column(
      children: [
        for (int i = 1; i <= 20; i++)
          seat(context, rowIndex, i, widget.onSeatSelected),
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
          onSeatSelected(rowIndex, colNum);
        },
        child: Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            color:
                (widget.selectedRow == rowIndex && widget.selectedCol == colNum)
                ? Colors.purple
                : (isDark ? Colors.white38 : Colors.grey[300]!),
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
    );
  }
}
