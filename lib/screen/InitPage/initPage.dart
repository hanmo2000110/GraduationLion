import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/initPageController.dart';
import 'department.dart';
import 'englishGrade.dart';
import 'englishSubmit.dart';
import 'semester.dart';

class InitPage extends StatefulWidget{
  const InitPage({super.key});

  @override
  _InitPageState createState() => _InitPageState();
}

class _InitPageState extends State<InitPage> {
  final InitPageController initPageController = Get.put(InitPageController());

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<InitPageController>(
      init: InitPageController(),
      builder: (_) => Obx(() => Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              SizedBox(
                  height: 60,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _.index.value==0 ? const SizedBox(width: 48)
                      : InkWell(
                        child: navButton('이전'),
                        onTap: ()=> _.decreaseIndex()
                      ),
                      DotsIndicator(
                        dotsCount: 4,
                        position: _.index.value,
                      ),
                      InkWell(
                          child: navButton('다음'),
                          onTap: (){
                            if(_.index.value==3){
                              Get.offNamed('/navigation');
                            }
                            else{
                              _.increaseIndex();
                            }
                          }
                      ),
                    ],
                  )
              ),
              Expanded(
                child: _body(_.index.value),
              )
            ],
          ),
        )
        ),
      ),
    );
  }

  Widget navButton(String msg){
    return SizedBox(
      width: 48, height: 28,
      child: Text(msg, textAlign: TextAlign.center, style: const TextStyle(fontSize: 16)),
    );
  }

  Widget _body(idx) {
    switch (idx) {
      case 0:
        return const InitDepartmentPage();
      case 1:
        return const InitSemesterPage();
      case 2:
        return const InitEnglishSubmitPage();
      case 3:
        return const InitEnglishGradePage();
    }
    return Container();
  }
}