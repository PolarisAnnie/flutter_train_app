import 'package:flutter/material.dart';
import 'package:flutter_train_app/station_list.dart';

class SelectStation extends StatelessWidget {
  String departure;
  String arrival;
  Function(bool, String) onUpdate;

  SelectStation({
    required this.departure,
    required this.arrival,
    required this.onUpdate,
  });

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      // 출발역, 도착역 감싸고 있는 박스 스타일 적용
      height: 200,
      width: double.infinity,
      decoration: BoxDecoration(
        color: isDark ? Colors.white24 : Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          StationSelector(true, departure, onUpdate),
          //세로선 스타일 적용
          Container(
            width: 2,
            height: 50,
            decoration: BoxDecoration(color: Colors.grey[400]),
          ),
          StationSelector(false, arrival, onUpdate),
        ],
      ),
    );
  }
}

class StationSelector extends StatelessWidget {
  StationSelector(this.isDeparture, this.stationName, this.onStationSelected);
  bool isDeparture;
  String stationName;
  Function(bool, String) onStationSelected;

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        stationStatus(isDeparture),
        TextButton(
          onPressed: () async {
            final result = await Navigator.push<String>(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return StationList(isDeparture, stationName);
                },
              ),
            );

            if (result != null) {
              onStationSelected(isDeparture, result);
            }
          },
          child: Text(
            stationName,
            style: TextStyle(
              fontSize: 40,
              color: isDark ? Colors.white : Colors.black,
            ),
          ),
        ),
      ],
    );
  }

  // 중복되는 부분 함수화
  Text stationStatus(bool isDeparture) {
    return Text(
      isDeparture ? "출발역" : "도착역",
      style: TextStyle(
        fontSize: 16,
        color: Colors.grey,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
