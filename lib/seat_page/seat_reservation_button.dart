import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SeatReservationButton extends StatelessWidget {
  String? selectedRow;
  int? selectedCol;
  SeatReservationButton(this.selectedRow, this.selectedCol);

  @override
  Widget build(BuildContext context) {
    bool isSeatSelected = selectedRow != null && selectedCol != null;
    return Padding(
      padding: const EdgeInsets.only(top: 0, bottom: 30, left: 20, right: 20),
      child: SizedBox(
        width: double.infinity,
        height: 50,
        child: ElevatedButton(
          onPressed: isSeatSelected
              ? () {
                  showCupertinoDialog(
                    context: context,
                    builder: (context) => CupertinoAlertDialog(
                      title: Text("예매 하시겠습니까?"),
                      content: Text("좌석 : $selectedRow-$selectedCol"),
                      actions: [
                        CupertinoDialogAction(
                          onPressed: () {
                            Navigator.pop(context);
                            Navigator.pop(context);
                          },
                          child: Text(
                            "확인",
                            style: TextStyle(color: Colors.blue),
                          ),
                        ),
                        CupertinoDialogAction(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text(
                            "취소",
                            style: TextStyle(color: Colors.red),
                          ),
                        ),
                      ],
                    ),
                  );
                }
              : null, // 좌석이 선택되지 않으면 버튼 비활성화
          child: Text("예매 하기"),
        ),
      ),
    );
  }
}
