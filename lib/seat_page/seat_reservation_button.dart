import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_train_app/home_page/home_page.dart';

class SeatReservationButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: SizedBox(
        width: double.infinity,
        height: 50,
        //버튼 Theme 적용
        child: ElevatedButton(
          onPressed: () {
            showCupertinoDialog(
              context: context,
              builder: (context) => CupertinoAlertDialog(
                title: Text("예매 하시겠습니까?"),
                content: Text("좌석 : 3-A"),
                actions: [
                  CupertinoDialogAction(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text("확인", style: TextStyle(color: Colors.blue)),
                  ),
                  CupertinoDialogAction(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text("취소", style: TextStyle(color: Colors.red)),
                  ),
                ],
              ),
            );
          },
          child: Text("예매 하기"),
        ),
      ),
    );
    // 버튼 Theme 적용
  }
}
