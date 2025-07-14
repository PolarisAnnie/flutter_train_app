import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// 좌석 예매를 위한 버튼 위젯
class SeatReservationButton extends StatelessWidget {
  String? selectedCol;
  int? selectedRow;
  SeatReservationButton(this.selectedCol, this.selectedRow);

  @override
  Widget build(BuildContext context) {
    // 좌석 선택 여부 확인 (열과 행이 모두 선택되어야 함)
    bool isSeatSelected = selectedCol != null && selectedRow != null;
    return Padding(
      padding: const EdgeInsets.only(top: 0, bottom: 30, left: 20, right: 20),
      child: SizedBox(
        width: double.infinity,
        height: 50,
        child: ElevatedButton(
          // 좌석이 선택된 경우에만 버튼 활성화
          onPressed: isSeatSelected
              ? () {
                  showCupertinoDialog(
                    context: context,
                    builder: (context) => CupertinoAlertDialog(
                      title: Text("예매 하시겠습니까?"),
                      content: Text("좌석 : $selectedCol-$selectedRow"),
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
