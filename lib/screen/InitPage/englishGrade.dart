import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/initPageController.dart';

class InitEnglishGradePage extends StatefulWidget{
  const InitEnglishGradePage({super.key});

  @override
  _InitEnglishGradePageState createState() => _InitEnglishGradePageState();
}

class _InitEnglishGradePageState extends State<InitEnglishGradePage> {
  final InitPageController initPageController = Get.put(InitPageController());

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('InitEnglishGradePage')
      ],

    );
  }
}