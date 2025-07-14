import 'package:flutter/material.dart';

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

class BookingResult extends StatefulWidget {
  @override
  State<BookingResult> createState() => _BookingResultState();
}

class _BookingResultState extends State<BookingResult> {
  List<BookingData> bookingList = [
    BookingData("수서", "동대구", "D", 12, 123456, DateTime.now()),
    BookingData("동탄", "경주", "B", 15, 123457, DateTime.now()),
    BookingData("천안아산", "동탄", "A", 3, 123458, DateTime.now()),
  ];

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    String formatDateTime(DateTime? dateTime) {
      if (dateTime == null) return "날짜없음";
      return "${dateTime.year}-${dateTime.month.toString().padLeft(2, '0')}-${dateTime.day} ${dateTime.hour}:${dateTime.minute}";
    }

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
                  Text(formatDateTime(booking.reservationTime)),
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
