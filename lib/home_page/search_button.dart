import 'package:flutter/material.dart';
import 'package:flutter_train_app/seat_page/seat_page.dart';

// 좌석 선택 페이지로 이동하는 버튼 위젯
class SearchButton extends StatelessWidget {
  String departure;
  String arrival;
  SearchButton({required this.departure, required this.arrival});

  // 출발역, 도착역이 모두 선택되었는지 확인하는 함수
  bool isChecked() {
    return departure != "선택" && arrival != "선택";
  }

  @override
  Widget build(BuildContext context) {
    if (isChecked()) {
      // 두 역이 모두 선택된 경우 : 활성화 버튼
      return SizedBox(
        width: double.infinity,
        height: 50,
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
          child: Text("좌석 선택"),
        ),
      );
    } else {
      // 하나라도 선택되지 않은 경우 : 비활성화된 버튼
      return SizedBox(
        width: double.infinity,
        height: 50,
        child: ElevatedButton(
          onPressed: null,
          child: Text("좌석 선택"),
          style: ElevatedButton.styleFrom(backgroundColor: Colors.grey),
        ),
      );
    }
  }
}
