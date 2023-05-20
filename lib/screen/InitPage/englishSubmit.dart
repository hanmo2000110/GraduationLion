import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/initPageController.dart';

class InitEnglishSubmitPage extends StatefulWidget{
  const InitEnglishSubmitPage({super.key});

  @override
  _InitEnglishSubmitPageState createState() => _InitEnglishSubmitPageState();
}

class _InitEnglishSubmitPageState extends State<InitEnglishSubmitPage> {
  final InitPageController initPageController = Get.put(InitPageController());

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('InitEnglishSubmitPage')
      ],

    );
  }
}