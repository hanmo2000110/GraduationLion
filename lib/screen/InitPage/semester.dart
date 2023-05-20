import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../controller/initPageController.dart';

class InitSemesterPage extends StatefulWidget{
  const InitSemesterPage({super.key});

  @override
  _InitSemesterPageState createState() => _InitSemesterPageState();
}

class _InitSemesterPageState extends State<InitSemesterPage> {
  final InitPageController initPageController = Get.find<InitPageController>();
  final textController = TextEditingController();

  @override
  void dispose() {
    initPageController.setSemester(int.parse(textController.text));
    textController.dispose();
    super.dispose();
  }

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
          child: Text('몇 학기 째\n재학 중이신가요?',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold
            ),
          ),
        ),
        const SizedBox(height: 20),
        SizedBox(
          width: 100, height: 120,
          child: TextField(
            controller: textController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                borderSide: BorderSide(color: Color(0xff00579C))
              ),
            ),
            style: const TextStyle(fontSize: 80),
            keyboardType: TextInputType.number,
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.digitsOnly
            ],
          ),
        )
      ],
    );
  }
}