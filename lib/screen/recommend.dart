import 'package:flutter/material.dart';

import 'package:graduationlion/controller/recommend_controller.dart';
import 'package:graduationlion/controller/user_controller.dart';
import 'package:graduationlion/core/constants/app_colors.dart';

class RecommendPage extends StatefulWidget {
  const RecommendPage({super.key});

  @override
  State<RecommendPage> createState() => RecommendPageState();
}

class RecommendPageState extends State<RecommendPage> {
  List<List> myCourseList = RecommendController.to.semesters;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        forceMaterialTransparency: true,
        backgroundColor: Colors.white,
        title: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 8),
          child: Text(
            '졸업사자님께 추천하는 졸업 계획',
            style: TextStyle(
              fontWeight: FontWeight.w800,
              fontSize: 16,
            ),
          ),
        ),
        centerTitle: false,
        elevation: 0.0,
      ),
      body: ListView(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              for (int i = UserController.to.semester; i < 8; i++)
                recommendCourseInfo(i, myCourseList[i])
            ],
          ),
        ],
      ),
    );
  }
}

Widget recommendCourseInfo(int semester, List myCourseList) {
  return Column(
    children: [
      Stack(
        alignment: AlignmentDirectional.center,
        children: [
          Container(
            height: 30,
            color: AppColors.sectionBackground,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 24),
                child: Text('${semester + 1}학기',
                    style: const TextStyle(fontSize: 10)),
              ),
            ],
          ),
        ],
      ),
      ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: myCourseList.length,
        itemBuilder: (context, index) {
          return ListTile(
            visualDensity: const VisualDensity(vertical: -3),
            contentPadding: const EdgeInsets.symmetric(horizontal: 24),
            leading: Text(
              myCourseList[index],
              style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) => divider(),
      )
    ],
  );
}

Widget semesterTitle(String semester) {
  // 학기 수
  return Stack(
    alignment: AlignmentDirectional.bottomStart,
    children: [
      Container(
        height: 30,
        color: AppColors.sectionBackground,
      ),
      Padding(
        padding: const EdgeInsets.only(left: 24, bottom: 5),
        child: Text('$semester학기', style: const TextStyle(fontSize: 10)),
      ),
    ],
  );
}

Widget divider() {
  return const Divider(
    thickness: 1,
    color: AppColors.fieldBackground,
    height: 0,
  );
}

Widget courseInfo(String title, List desc) {
  // 학기 별 강의 목록, 강의 정보

  var showList = desc.join(", ");

  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 11),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
        ),
        Text(
          showList,
          textAlign: TextAlign.end,
          style: const TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 14,
              color: AppColors.mutedText,
              height: 1.1),
        ),
      ],
    ),
  );
}
