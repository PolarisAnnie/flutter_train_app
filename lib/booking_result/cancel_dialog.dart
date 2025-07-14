import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// 예매 내역 취소 다이얼로그
class CancelDialog {
  static Future<void> show({
    required BuildContext context,
    required String seatInfo,
    required VoidCallback onConfirm,
  }) {
    return showCupertinoDialog(
      context: context,
      builder: (context) => CupertinoAlertDialog(
        title: Text("예매 취소하시겠습니까?"),
        content: Text("좌석 : $seatInfo"),
        actions: [
          CupertinoDialogAction(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text("돌아가기", style: TextStyle(color: Colors.blue)),
          ),
          CupertinoDialogAction(
            onPressed: () {
              Navigator.pop(context);
              onConfirm(); // 확인 버튼 클릭 시 전달받은 함수 실행
            },
            child: Text("예매 취소", style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }
}
