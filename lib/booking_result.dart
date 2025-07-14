import 'package:flutter/material.dart';

class BookingData {
  String? departure;
  String? arrival;
  String? seatCol;
  int? seatRow;
  var ticketUID;

  BookingData(
    this.departure,
    this.arrival,
    this.seatCol,
    this.seatRow,
    this.ticketUID,
  );
}

class BookingResult extends StatefulWidget {
  @override
  State<BookingResult> createState() => _BookingResultState();
}

class _BookingResultState extends State<BookingResult> {
  List<BookingData> bookingList = [
    BookingData("수서", "동대구", "D", 12, 123456),
    BookingData("동탄", "경주", "B", 15, 123457),
    BookingData("천안아산", "동탄", "A", 3, 123458),
  ];

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(title: Text("예매 내역")),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
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
                  Text("예약 완료: 2025년 7월 14일(월) 19시 50분"),
                  SizedBox(height: 15),
                  Text(
                    "${booking.departure} > ${booking.arrival}",
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.purple,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text("좌석 : ${booking.seatCol}-${booking.seatRow}"),
                  SizedBox(height: 15),
                  TextButton(onPressed: () {}, child: Text("취소")),
                ],
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
