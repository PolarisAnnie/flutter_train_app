import 'package:flutter/material.dart';
import 'package:flutter_train_app/seat_page/seat_page.dart';
import 'package:flutter_train_app/station_list.dart';

class SearchButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      //버튼 Theme 적용
      child: ElevatedButton(
        //TODO station_list 앱바 타이틀에 selectStatus 전달 창구
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return SeatPage();
              },
            ),
          );
        },
        // 버튼 Theme 적용
        child: Text("좌석 선택"),
      ),
    );
  }
}
