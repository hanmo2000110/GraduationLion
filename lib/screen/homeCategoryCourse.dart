import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduationlion/model/gcourseModel.dart';

class HomeCategoryCourse extends StatefulWidget {
  const HomeCategoryCourse({super.key});

  @override
  State<HomeCategoryCourse> createState() => HomeCategoryCourseState();
}

class HomeCategoryCourseState extends State<HomeCategoryCourse> {
  List<GCourseModel> courses = Get.arguments["snapshots"];

  @override
  Widget build(BuildContext context) {
    var categories = getCategories(courses);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        forceMaterialTransparency: true,
        backgroundColor: Colors.white,
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Text(
            Get.arguments['title'],
            style: const TextStyle(
              fontWeight: FontWeight.w800,
              fontSize: 16,
            ),
          ),
        ),
      ),
    body: ListView.builder(
      itemCount: categories.length,
      itemBuilder: (BuildContext context, int index) {
        List<String> categoryCourses = [];
        for (var element in courses){
          if(element.category == categories[index]){
            categoryCourses.add(element.name);
          }
        }
        categoryCourses.sort();
        return Column(
          children: [
            Container(
              height: 30,
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.fromLTRB(24, 10, 0, 0),
              color: const Color(0xFFEFEFF4),
              child: Text(categories[index],
                style: const TextStyle(fontSize: 10),
              ),
            ),
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: categoryCourses.length,
              itemBuilder: (BuildContext context, int idx){
                return ListTile(
                  visualDensity: const VisualDensity(vertical: -3),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 24),
                  leading: Text(categoryCourses[idx],
                    style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
                  ),
                );
              },
              separatorBuilder: (context, index) => const Divider(
                thickness: 1,
                color: Color(0xffC4C4C4),
                height: 0,
              ),
            ),
          ],
        );
      },
    )
    );
  }

  List getCategories(List<GCourseModel> courses) {
    Set cate = {};
    for (var element in courses) {
      cate.add(element.category);
    }
    return cate.toList();
  }
}