import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/initPageController.dart';

class InitEnglishGradePage extends StatefulWidget{
  const InitEnglishGradePage({super.key});

  @override
  _InitEnglishGradePageState createState() => _InitEnglishGradePageState();
}

class _InitEnglishGradePageState extends State<InitEnglishGradePage> {
  final InitPageController initPageController = Get.find<InitPageController>();
  List<String> gradeList = [
    'EF',
    'EC',
    'ERC',
    'EAP'
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
          child: Text('영어 교양 수강 시작\n단계가 무엇인가요?',
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
              itemCount: gradeList.length,
              itemBuilder: (BuildContext context, int index) {
                return Obx(() => ListTile(
                  title: Text(gradeList[index]),
                  onTap: () => initPageController.setEnglishGrade(index),
                  tileColor: index==initPageController.englishGrade.value ? Color(0xff00579C) : Colors.white,
                  textColor: index==initPageController.englishGrade.value ? Colors.white : Colors.black,
                ));
              },
              separatorBuilder: (BuildContext context, int index) => const Divider(height: 0),
            )
        )
      ],
    );
  }
}