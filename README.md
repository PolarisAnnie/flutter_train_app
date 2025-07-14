# 🚄 Flutter 기차 예매 앱

> **Flutter를 사용한 기차 좌석 예매 애플리케이션**  
> 출발역/도착역 선택부터 좌석 예매, 예매 내역 관리까지의 전체 플로우를 구현한 모바일 앱

## 📱 앱 개요

이 프로젝트는 Flutter를 사용하여 개발된 기차 예매 시스템입니다. 사용자가 출발역과 도착역을 선택하고, 실시간으로 좌석을 확인하여 예매할 수 있으며,
예매 내역을 관리할 수 있는 직관적인 인터페이스를 제공합니다.

### 🎯 주요 기능

- ✅ **역 선택**: 출발역과 도착역 선택 기능
- ✅ **좌석 배치도**: 실제 기차와 유사한 좌석 레이아웃
- ✅ **실시간 좌석 선택**: 터치로 간편한 좌석 선택
- ✅ **예매 확인**: iOS 스타일 확인 다이얼로그
- ✅ **예매 내역 관리**: 예매 완료 후 내역 확인 및 취소
- ✅ **예매 취소**: 쿠퍼티노 다이얼로그를 통한 예매 취소
- ✅ **토스트 알림**: 예매 취소 완료 시 하단 알림 메시지
- ✅ **다크 모드 지원**: 시스템 테마 자동 대응

## 🏗️ 프로젝트 구조

```
lib/
├── main.dart                           # 앱 진입점
├── home_page/                          # 메인 화면 관련
│   ├── home_page.dart                  # 홈페이지 메인
│   ├── search_button.dart              # 좌석 선택 버튼
│   └── select_station.dart             # 역 선택 위젯
├── seat_page/                          # 좌석 선택 관련
│   ├── seat_page.dart                  # 좌석 선택 메인 페이지
│   ├── seat_index.dart                 # 좌석 행/열 인덱스
│   ├── seat_list.dart                  # 좌석 리스트 컨테이너
│   ├── select_seat_box.dart            # 좌석 선택 박스
│   ├── seat_staion.dart                # 역 정보 표시
│   ├── seat_label.dart                 # 좌석 상태 범례
│   └── seat_reservation_button.dart    # 예매 버튼
├── booking_result/                     # 예매 내역 관련
│   ├── booking_result.dart             # 예매 내역 메인 
│   └── cancel_dialog.dart              # 예매 취소 시 다이얼로그
└── station_list.dart                   # 역 목록 페이지
```


## 🔧 핵심 기술 구현

### 상태 관리 전략
```dart
// 전역 상태 (여러 페이지에서 사용)
String departure = "선택";
String arrival = "선택";

// 지역 상태 (페이지별 관리)
class _SeatPageState extends State<SeatPage> {
  String? selectedCol;  // 선택된 좌석 열
  int? selectedRow;     // 선택된 좌석 행
}
```

### 위젯 간 데이터 전달
```dart
// 콜백 패턴을 통한 상태 업데이트
void onSeatSelected(String col, int row) {
  setState(() {
    selectedCol = col;
    selectedRow = row;
  });
}

// 생성자를 통한 데이터 전달
SelectSeatBox(selectedCol, selectedRow, onSeatSelected)
```

### 좌석 선택 로직
```dart
// 좌석 선택 상태 확인
bool isSelected = (widget.selectedCol == columnLabel && 
                  widget.selectedRow == rowNumber);

// 선택된 좌석 스타일 적용
color: isSelected ? Colors.purple : Colors.grey[300]
```

## 📋 주요 위젯 설명

### HomePage 관련
| 위젯 | 역할 | 주요 기능 |
|------|------|-----------|
| `HomePage` | 메인 화면 관리 | 출발역/도착역 상태 관리 |
| `SelectStation` | 역 선택 UI | 출발역/도착역 선택 위젯 조합 |
| `SearchButton` | 검색 버튼 | 조건부 활성화 및 페이지 이동 |

### SeatPage 관련
| 위젯 | 역할 | 주요 기능 |
|------|------|-----------|
| `SeatPage` | 좌석 선택 메인 | 좌석 선택 상태 관리 |
| `SeatList` | 좌석 영역 컨테이너 | 스크롤 가능한 좌석 배치 |
| `SelectSeatBox` | 좌석 선택 박스 | 실제 좌석 렌더링 및 선택 처리 |
| `SeatColIndex` | 열 인덱스 | A, B, C, D 라벨 표시 |
| `SeatRowIndex` | 행 인덱스 | 1~20 행 번호 표시 |

### 예매 관리 관련
| 위젯 | 역할 | 주요 기능 |
|------|------|-----------|
| `BookingResult` | 예매 내역 화면 | 예매 목록 표시 및 취소 관리 |
| `CancelDialog` | 취소 확인 다이얼로그 | 재사용 가능한 취소 확인 팝업 |
| `BookingData` | 예매 데이터 모델 | 예매 정보 구조화 |

### 공통 위젯
| 위젯 | 역할 | 주요 기능 |
|------|------|-----------|
| `StationList` | 역 목록 화면 | 역 선택 및 중복 방지 |
| `SeatStation` | 역 정보 표시 | 출발역 → 도착역 시각화 |
| `SeatReservationButton` | 예매 버튼 | 조건부 활성화 및 확인 다이얼로그 |

## 🎯 데이터 흐름

### 1. 역 선택 플로우
```
HomePage (상태 관리)
    ↓ 역 선택 요청
StationList (역 목록 표시)
    ↓ 선택된 역 반환
HomePage (상태 업데이트)
    ↓ 조건 충족 시
SeatPage (좌석 선택 페이지)
```

### 2. 좌석 선택 플로우
```
SeatPage (좌석 상태 관리)
    ↓ 좌석 정보 + 콜백 전달
SelectSeatBox (좌석 렌더링)
    ↓ 사용자 좌석 클릭
onSeatSelected() (상태 업데이트)
    ↓ 선택 정보 전달
SeatReservationButton (예매 진행)
```

### 3. 예매 및 관리 플로우
```
SeatReservationButton (예매 확인)
    ↓ 예매 데이터 생성
BookingData (데이터 모델)
    ↓ bookingList에 추가
BookingResult (내역 표시)
    ↓ 취소 버튼 클릭
CancelDialog (취소 확인)
    ↓ 확인 시
bookingList에서 제거 + SnackBar 알림
```

---
 [🔥 프로젝트 타임라인 및 트러블슈팅 확인하기](https://polariseunhee94.notion.site/2293216a4dd280b6a904cc30a7658652?source=copy_link)
