import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toon_flix_02/provider/pomodoro_provider.dart';
import 'package:toon_flix_02/screens/home_screen.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => PomodoroProvider(),
    //PomodorProvider의 인스턴스를 생성하고 앱 전체에서 사용할 수 있도록 제공 
    child: App(),
    //App 위젯이 앱의 메인 UI를 정의
  ));
}

//ChangeNotifierProvider가 이 App 위젯과 그 하위 위젯들에게 PomodoroProvider제공

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xffE7626C),
        textTheme: const TextTheme(
          headlineLarge: TextStyle(
            color: Color(0xff232B55),
          ),
        ),
        cardColor: const Color(0xffF4EDDB),
      ),
      home: const HomeScreen(),
    );
  }
}
