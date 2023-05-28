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
    'AI·컴퓨터공학심화',
    '전자공학심화',
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
          child: Text('전공이 무엇인가요?',
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
            itemCount: departmentList.length,
            itemBuilder: (BuildContext context, int index) {
              return Obx(() => ListTile(
                title: Text(departmentList[index]),
                onTap: () => initPageController.setDepartment(index),
                tileColor: index==initPageController.department.value ? const Color(0xff00579C) : Colors.white,
                textColor: index==initPageController.department.value ? Colors.white : Colors.black,
              ));
            },
            separatorBuilder: (BuildContext context, int index) => const Divider(height: 0),
          )
        ),
      ],
    );
  }
}