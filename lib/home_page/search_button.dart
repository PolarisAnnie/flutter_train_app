import 'package:flutter/material.dart';
import 'package:flutter_train_app/seat_page/seat_page.dart';

class SearchButton extends StatelessWidget {
  String departure;
  String arrival;
  SearchButton({required this.departure, required this.arrival});

  // 두가지 역이 모두 선택되었는지 확인하는 함수
  bool isChecked() {
    return departure != "선택" && arrival != "선택";
  }

  @override
  Widget build(BuildContext context) {
    if (isChecked()) {
      return SizedBox(
        width: double.infinity,
        height: 50,
        //버튼 Theme 적용
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return SeatPage(departure, arrival);
                },
              ),
            );
          },
          // 버튼 Theme 적용
          child: Text("좌석 선택"),
        ),
      );
    } else {
      return SizedBox(
        width: double.infinity,
        height: 50,
        child: ElevatedButton(
          onPressed: () {},
          child: Text("좌석 선택"),
          style: ElevatedButton.styleFrom(backgroundColor: Colors.grey),
        ),
      );
    }
  }
}
