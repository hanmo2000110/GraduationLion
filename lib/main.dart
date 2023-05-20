import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:graduationlion/screen/splash.dart';
import 'firebase_options.dart';
import 'package:get/get.dart';
import 'package:graduationlion/route/pages.dart';
import 'package:graduationlion/binding/binding.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MyUIBuilding',
      theme: ThemeData(
        // 아이콘 클릭 시 물결 효과 없애기
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
        useMaterial3: true,
      ),
      home: SplashScreen(),
      initialRoute: AppPages.initial,
      getPages: AppPages.routes,
      initialBinding: InitBinding(),
    );
  }
}
