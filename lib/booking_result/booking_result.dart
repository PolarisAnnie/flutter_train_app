import 'package:flutter/material.dart';
import 'cancel_dialog.dart';

// 예매 내역 리스트
List<BookingData> bookingList = [];

// 예매 내역에 포함되는 속성과 생성자 정의
class BookingData {
  String? departure;
  String? arrival;
  String? seatCol;
  int? seatRow;
  var ticketUID;
  DateTime? reservationTime;

  BookingData(
    this.departure,
    this.arrival,
    this.seatCol,
    this.seatRow,
    this.ticketUID,
    this.reservationTime,
  );
}

// 예매 내역을 보여주는 화면
class BookingResult extends StatefulWidget {
  @override
  State<BookingResult> createState() => _BookingResultState();
}

class _BookingResultState extends State<BookingResult> {
  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    String formatDateTime(DateTime? dateTime) {
      if (dateTime == null) return "날짜없음";
      return "${dateTime.year}-${dateTime.month.toString().padLeft(2, '0')}-${dateTime.day} ${dateTime.hour}:${dateTime.minute.toString().padLeft(2, '0')}";
    }

    return Scaffold(
      appBar: AppBar(title: Text("예매 내역")),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),

        child: bookingList.isEmpty
            ? // 예매 내역이 없을 때
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.train, size: 80, color: Colors.grey),
                    SizedBox(height: 16),
                    Text(
                      "예매 내역이 없습니다",
                      style: TextStyle(fontSize: 18, color: Colors.grey),
                    ),
                    SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text("기차 예매하러 가기"),
                    ),
                  ],
                ),
              )
            : // 예매 내역이 있을 때
              ListView(
                children: bookingList.map((booking) {
                  return Container(
                    height: 200,
                    width: double.infinity,
                    margin: EdgeInsets.only(bottom: 16),
                    decoration: BoxDecoration(
                      color: isDark ? Colors.white24 : Colors.grey[200]!,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(height: 20),
                        // 예매 완료 일시
                        Text(formatDateTime(booking.reservationTime)),
                        SizedBox(height: 15),

                        // 출발역, 도착역 내역
                        Text(
                          "${booking.departure ?? "출발역 없음"} > ${booking.arrival ?? "도착역 없음"}", // 🔍 null 체크 추가
                          style: TextStyle(
                            fontSize: 30,
                            color: Colors.purple,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        // 좌석 정보
                        Text(
                          "좌석 : ${booking.seatCol}-${booking.seatRow}",
                        ), // 🔍 null 체크 추가
                        SizedBox(height: 15),

                        // 예매 취소 버튼
                        TextButton(
                          onPressed: () {
                            CancelDialog.show(
                              context: context,
                              seatInfo: "${booking.seatCol}-${booking.seatRow}",
                              onConfirm: () {
                                setState(() {
                                  bookingList.remove(booking);
                                });
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      "${booking.departure} → ${booking.arrival} 예매가 취소되었습니다",
                                    ),
                                    backgroundColor: Colors.red,
                                  ),
                                );
                              },
                            );
                          },
                          child: Text(
                            "예매 취소",
                            style: TextStyle(color: Colors.red),
                          ),
                        ),
                      ],
                    ),
                  );
                }).toList(),
              ),
      ),
    );
  }
}
