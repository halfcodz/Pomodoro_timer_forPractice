import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toon_flix_02/provider/pomodoro_provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Column(
        children: [
          // 1. 타이머 출력
          Flexible(
            flex: 1,
            child: Consumer<PomodoroProvider>(
              builder: (context, pomodoro, child) {
                return Container(
                  alignment: Alignment.bottomCenter,
                  child: Text(
                    pomodoro.formatTime(pomodoro.totalSeconds),
                    style: TextStyle(
                      color: Theme.of(context).cardColor,
                      fontSize: 89,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                );
              },
            ),
          ),
          // 2. 시작/일시정지 버튼
          Flexible(
            flex: 3,
            child: Consumer<PomodoroProvider>(
              builder: (context, pomodoro, child) {
                return Center(
                  child: IconButton(
                    onPressed: pomodoro.isRunning
                        ? pomodoro.pauseTimer
                        : pomodoro.startTimer,
                    icon: Icon(
                      pomodoro.isRunning
                          ? Icons.pause_circle_outline
                          : Icons.play_circle_outline,
                    ),
                    iconSize: 120,
                    color: Theme.of(context).cardColor,
                  ),
                );
              },
            ),
          ),
          // 3. 완료된 Pomodoro 횟수
          Flexible(
            flex: 1,
            child: Consumer<PomodoroProvider>(
              builder: (context, pomodoro, child) {
                return Row(
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Theme.of(context).cardColor,
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Pomodoro',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                color: Theme.of(context)
                                    .textTheme
                                    .displayLarge!
                                    .color,
                              ),
                            ),
                            Text(
                              '${pomodoro.totalPomodoros}',
                              style: TextStyle(
                                fontSize: 58,
                                fontWeight: FontWeight.w600,
                                color: Theme.of(context)
                                    .textTheme
                                    .displayLarge!
                                    .color,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
