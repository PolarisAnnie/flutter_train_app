import 'package:flutter/material.dart';
import 'package:flutter_train_app/station_list.dart';

// 출발역과 도착역을 선택할 수 있는 위젯
class SelectStation extends StatelessWidget {
  String departure;
  String arrival;

  // 역 선택 시 호출되는 콜백 함수
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
          // 출발역 선택기(왼쪽)
          StationSelector(true, departure, arrival, onUpdate),

          //구분선 스타일 적용
          Container(
            width: 2,
            height: 50,
            decoration: BoxDecoration(color: Colors.grey[400]),
          ),

          // 도착역 선택기(오른쪽)
          StationSelector(false, arrival, departure, onUpdate),
        ],
      ),
    );
  }
}

// 개별역(출발역 또는 도착역)을 선택하는 위젯
class StationSelector extends StatelessWidget {
  bool isDeparture;
  String stationName;
  String oppositeName; // 중복된 역 이름 제거를 위한 확인용
  Function(bool, String) onStationSelected;

  StationSelector(
    this.isDeparture,
    this.stationName,
    this.oppositeName,
    this.onStationSelected,
  );

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // 역 타입 표시 라벨 (출발역 / 도착역))
        stationStatus(isDeparture),

        // 역 이름 선택 버튼
        TextButton(
          onPressed: () async {
            final result = await Navigator.push<String>(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return StationList(isDeparture, oppositeName);
                },
              ),
            );

            // 역이 선택되었을 때 콜백 함수 호출
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

  // 출발역 또는 도착역 라벨 위젯
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
