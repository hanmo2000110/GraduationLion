import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/initPageController.dart';

class InitDepartmentPage extends StatefulWidget{
  const InitDepartmentPage({super.key});

  @override
  _InitDepartmentPageState createState() => _InitDepartmentPageState();
}

class _InitDepartmentPageState extends State<InitDepartmentPage> {
  final InitPageController initPageController = Get.find<InitPageController>();
  List<String> departmentList = [
    '전산전자공학부',
    'gg'
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
          height: 90,
          child: Text('어떤 학부에\n소속되어있으신가요?',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold
            ),
          ),
        ),
        const Divider(),
        Expanded(
        child: ListView.separated(
          itemCount: departmentList.length,
          itemBuilder: (BuildContext context, int index) {
            return Obx(() => ListTile(
              title: Text(departmentList[index]),
              onTap: () => initPageController.setDepartment(index),
              tileColor: index==initPageController.department.value ? Color(0xff00579C) : Colors.white,
              textColor: index==initPageController.department.value ? Colors.white : Colors.black,
            ));
          },
          separatorBuilder: (BuildContext context, int index) => const Divider(),
        )
        )
      ],
    );
  }
}