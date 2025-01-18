import 'dart:async';

import 'package:flutter/material.dart';

class PomodoroProvider extends ChangeNotifier {
  static const twentyFiveMinutes = 10;
  int totalSeconds = twentyFiveMinutes;
  bool isRunning = false;
  int totalPomodoros = 0;
  Timer? _timer;

  // 타이머 시작
  void startTimer() {
    if (_timer != null && _timer!.isActive) return; // 이미 실행 중이면 무시
    isRunning = true;
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (totalSeconds == 0) {
        onTimeComplete();
      } else {
        totalSeconds--;
        notifyListeners(); // 상태 변경 알림
      }
    });
    notifyListeners();
  }

  // 2. 타이머 일시정지
  void pauseTimer() {
    _timer?.cancel();
    isRunning = false;
    notifyListeners();
  }

  // 3. 타이머 완료 처리
  void onTimeComplete() {
    totalPomodoros++;
    isRunning = false;
    totalSeconds = twentyFiveMinutes; // 타이머 초기화
    _timer?.cancel();
    notifyListeners();
  }

  // 4. 타이머 포맷 변환
  String formatTime(int seconds) {
    var duration = Duration(seconds: seconds);
    return duration.toString().split(".").first.substring(2, 7);
  }
}
