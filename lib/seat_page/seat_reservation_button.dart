import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'package:flutter_train_app/booking_result.dart';

// 좌석 예매를 위한 버튼 위젯
class SeatReservationButton extends StatelessWidget {
  String? selectedCol;
  int? selectedRow;
  String departure;
  String arrival;
  SeatReservationButton(
    this.selectedCol,
    this.selectedRow,
    this.departure,
    this.arrival,
  );

  @override
  Widget build(BuildContext context) {
    // 좌석 선택 여부 확인 (열과 행이 모두 선택되어야 함)
    bool isSeatSelected = selectedCol != null && selectedRow != null;

    // 예매내역별 UID 생성 함수
    String generateUID() {
      // 1. 날짜 부분 만들기(YYYYMMDD)
      DateTime now = DateTime.now();
      String datePart =
          "${now.year}${now.month.toString().padLeft(2, '0')}${now.day.toString().padLeft(2, '0')}";

      // 2. 난수 10자리 생성
      Random random = Random();
      String randomPart = '';
      for (int i = 0; i < 10; i++) {
        randomPart += random.nextInt(10).toString();
      } // 0~9 중 랜덤 숫자

      //3. 합치기
      return datePart + randomPart;
    }

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
                            // 새로운 예매 내역 정보
                            BookingData newBooking = BookingData(
                              departure,
                              arrival,
                              selectedCol,
                              selectedRow,
                              generateUID(),
                              DateTime.now(),
                            );

                            // 예매 내역 리스트에 추가
                            bookingList.add(newBooking);

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
