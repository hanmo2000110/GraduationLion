import 'package:flutter/material.dart';
import 'navigationPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MyUIBuilding',
      theme: ThemeData(
        // 아이콘 클릭 시 물결 효과 없애기
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
        useMaterial3: true,
      ),
      home: const NavigationPage(),
    );
  }
}
