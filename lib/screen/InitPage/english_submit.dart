import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:graduationlion/controller/init_page_controller.dart';
import 'package:graduationlion/core/constants/app_colors.dart';

class InitEnglishSubmitPage extends StatefulWidget {
  const InitEnglishSubmitPage({super.key});

  @override
  State<InitEnglishSubmitPage> createState() => _InitEnglishSubmitPageState();
}

class _InitEnglishSubmitPageState extends State<InitEnglishSubmitPage> {
  final InitPageController initPageController = Get.find<InitPageController>();
  List<String> list = ['예', '아니요'];

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
          child: Text(
            '졸업 영어 성적을\n제출하셨나요?',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
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
                  tileColor: index == initPageController.englishSubmit.value
                      ? AppColors.primary
                      : Colors.white,
                  textColor: index == initPageController.englishSubmit.value
                      ? Colors.white
                      : Colors.black,
                ));
          },
          separatorBuilder: (BuildContext context, int index) =>
              const Divider(height: 0),
        ))
      ],
    );
  }
}
