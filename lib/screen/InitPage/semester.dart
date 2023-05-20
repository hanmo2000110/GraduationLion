import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/initPageController.dart';

class InitSemesterPage extends StatefulWidget{
  const InitSemesterPage({super.key});

  @override
  _InitSemesterPageState createState() => _InitSemesterPageState();
}

class _InitSemesterPageState extends State<InitSemesterPage> {
  final InitPageController initPageController = Get.put(InitPageController());

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('InitSemesterPage')
      ],

    );
  }
}