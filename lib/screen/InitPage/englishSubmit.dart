import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/initPageController.dart';

class InitEnglishSubmitPage extends StatefulWidget{
  const InitEnglishSubmitPage({super.key});

  @override
  _InitEnglishSubmitPageState createState() => _InitEnglishSubmitPageState();
}

class _InitEnglishSubmitPageState extends State<InitEnglishSubmitPage> {
  final InitPageController initPageController = Get.find<InitPageController>();
  List<String> list = [
    '예',
    '아니요'
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 120,
          child: Text('졸업 영어 성적을\n제출하셨나요?',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold
            ),
          ),
        ),
        const Divider(height: 0),
        Expanded(
            child: ListView.separated(
              itemCount: list.length,
              itemBuilder: (BuildContext context, int index) {
                return Obx(() => ListTile(
                  title: Text(list[index]),
                  onTap: () => initPageController.setEnglishSubmit(index),
                  tileColor: index==initPageController.englishSubmit.value ? Color(0xff00579C) : Colors.white,
                  textColor: index==initPageController.englishSubmit.value ? Colors.white : Colors.black,
                ));
              },
              separatorBuilder: (BuildContext context, int index) => const Divider(height: 0),
            )
        )
      ],
    );
  }
}