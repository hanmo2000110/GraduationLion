// ignore_for_file: deprecated_member_use

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:graduationlion/controller/user_controller.dart';
import 'package:graduationlion/core/constants/app_colors.dart';
import 'package:graduationlion/core/constants/firestore_collections.dart';

class AddCoursePage extends StatefulWidget {
  const AddCoursePage({super.key});

  @override
  State<AddCoursePage> createState() => AddCoursePageState();
}

Widget divider() {
  return Container(
    width: double.infinity,
    height: 1,
    color: AppColors.fieldBackground,
  );
}

enum CourseLanguage { korean, english }

enum CourseGradeType { grade, passFail }

class AddCoursePageState extends State<AddCoursePage> {
  final myController = TextEditingController();
  CourseLanguage? courseLanguage = CourseLanguage.korean;
  CourseGradeType? courseGradeType = CourseGradeType.grade;

  @override
  Widget build(BuildContext context) {
    var arguments = Get.arguments;

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          scrolledUnderElevation: 0.0,
          backgroundColor: Colors.white,
          leadingWidth: 30,
          title: SizedBox(
            height: 40,
            child: TextField(
              onChanged: ((text) {
                setState(() {});
              }),
              controller: myController,
              cursorColor: Colors.white,
              style: const TextStyle(
                  fontSize: 15, decorationThickness: 0, color: Colors.white),
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.search, color: Colors.white),
                filled: true,
                fillColor: AppColors.fieldBackground,
                contentPadding: EdgeInsets.symmetric(
                  vertical: 8,
                  horizontal: 16,
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(width: 1, color: AppColors.fieldBackground),
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(width: 1, color: AppColors.fieldBackground),
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                hintText: '강의명 입력',
                hintStyle: TextStyle(color: Colors.white),
              ),
            ),
          ),
          bottom: const TabBar(
            labelColor: AppColors.primary,
            indicatorColor: AppColors.primary,
            tabs: <Widget>[
              Tab(
                  child: Text(
                "전공",
                style: TextStyle(fontSize: 14),
              )),
              Tab(
                  child: Text(
                "교양",
                style: TextStyle(fontSize: 14),
              )),
            ],
          ),
        ),
        body: TabBarView(
          physics: const BouncingScrollPhysics(),
          children: [
            StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection(FirestoreCollections.courses)
                  .orderBy('name', descending: false)
                  .snapshots(),
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }

                final docs = snapshot.data!.docs;

                var searchedList = [];
                for (var element in docs) {
                  if ((element.data()['name'] as String)
                      .contains(myController.text)) {
                    searchedList.add(element);
                  }
                }

                return ListView.separated(
                  shrinkWrap: true,
                  itemCount: searchedList.length,
                  itemBuilder: (context, index) {
                    return SizedBox(
                      height: 69,
                      child: ListTile(
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 24, vertical: 10),
                        leading: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              searchedList[index]['name'],
                              style: const TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 13),
                            ),
                            const Padding(padding: EdgeInsets.only(top: 4)),
                            Text(
                              '${searchedList[index]['credit']}학점 (설계 ${searchedList[index]['design']}학점), ${searchedList[index]['type']}',
                              style: const TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 11,
                                  color: AppColors.mutedText,
                                  height: 1.4),
                            ),
                          ],
                        ),
                        trailing: Container(
                          margin: const EdgeInsets.only(bottom: 10),
                          height: 30,
                          width: 44,
                          child: ElevatedButton(
                            onPressed: () => showDialog<void>(
                              context: context,
                              barrierDismissible: false,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  elevation: 0.0,
                                  backgroundColor: Colors.white,
                                  title: const Padding(
                                      padding: EdgeInsets.only(bottom: 7),
                                      child: Text('강의를 추가하시겠습니까?',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w700,
                                          ))),
                                  actions: [
                                    TextButton(
                                        style: TextButton.styleFrom(
                                          minimumSize: Size.zero,
                                          padding: EdgeInsets.zero,
                                          tapTargetSize:
                                              MaterialTapTargetSize.shrinkWrap,
                                        ),
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: const Text("취소",
                                            style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 14))),
                                    const Padding(
                                        padding: EdgeInsets.only(right: 7)),
                                    TextButton(
                                        style: TextButton.styleFrom(
                                          minimumSize: Size.zero,
                                          padding: EdgeInsets.zero,
                                          tapTargetSize:
                                              MaterialTapTargetSize.shrinkWrap,
                                        ),
                                        onPressed: () async {
                                          bool duplicated = await UserController
                                              .to
                                              .checkDuplicated(
                                                  searchedList[index].data());
                                          if (!duplicated) {
                                            await UserController.to
                                                .addCourseData(
                                                    searchedList[index].data(),
                                                    courseLanguage ==
                                                            CourseLanguage
                                                                .english
                                                        ? true
                                                        : false,
                                                    courseGradeType ==
                                                            CourseGradeType
                                                                .grade
                                                        ? "G"
                                                        : "PF",
                                                    arguments['semester']);
                                            Get.offNamed('/navigation');
                                          } else {
                                            Get.back();
                                            Get.snackbar(
                                                "과목 추가 실패", "이미 추가한 과목입니다.");
                                          }
                                        },
                                        child: const Text("추가",
                                            style: TextStyle(
                                                color: AppColors.primary,
                                                fontSize: 14))),
                                  ],
                                  content: StatefulBuilder(builder:
                                      (BuildContext context,
                                          StateSetter setState) {
                                    return Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text(
                                            '[전공] ${searchedList[index]['name']}\n${searchedList[index]['credit']}학점 (설계 ${searchedList[index]['design']}학점), ${searchedList[index]['type']}',
                                            textAlign: TextAlign.center,
                                            style:
                                                const TextStyle(fontSize: 12)),
                                        const Padding(
                                            padding:
                                                EdgeInsets.only(bottom: 10)),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Row(
                                              children: [
                                                Radio(
                                                    splashRadius: 0.0,
                                                    activeColor:
                                                        AppColors.primary,
                                                    materialTapTargetSize:
                                                        MaterialTapTargetSize
                                                            .shrinkWrap,
                                                    value:
                                                        CourseLanguage.korean,
                                                    groupValue: courseLanguage,
                                                    onChanged: (value) {
                                                      setState(() =>
                                                          courseLanguage =
                                                              value);
                                                    }),
                                                const Text("한국어분반",
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontSize: 12)),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                Radio(
                                                    splashRadius: 0.0,
                                                    activeColor:
                                                        AppColors.primary,
                                                    materialTapTargetSize:
                                                        MaterialTapTargetSize
                                                            .shrinkWrap,
                                                    value:
                                                        CourseLanguage.english,
                                                    groupValue: courseLanguage,
                                                    onChanged: (value) {
                                                      setState(() =>
                                                          courseLanguage =
                                                              value);
                                                    }),
                                                const Text("영어분반",
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontSize: 12)),
                                              ],
                                            ),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Row(
                                              children: [
                                                Radio(
                                                    splashRadius: 0.0,
                                                    activeColor:
                                                        AppColors.primary,
                                                    materialTapTargetSize:
                                                        MaterialTapTargetSize
                                                            .shrinkWrap,
                                                    value:
                                                        CourseGradeType.grade,
                                                    groupValue: courseGradeType,
                                                    onChanged: (value) {
                                                      setState(() =>
                                                          courseGradeType =
                                                              value);
                                                    }),
                                                const Text("Grade 성적",
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontSize: 12)),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                Radio(
                                                    splashRadius: 0.0,
                                                    activeColor:
                                                        AppColors.primary,
                                                    materialTapTargetSize:
                                                        MaterialTapTargetSize
                                                            .shrinkWrap,
                                                    value: CourseGradeType
                                                        .passFail,
                                                    groupValue: courseGradeType,
                                                    onChanged: (value) {
                                                      setState(() =>
                                                          courseGradeType =
                                                              value);
                                                    }),
                                                const Text("P/F 성적",
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontSize: 12)),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ],
                                    );
                                  }),
                                );
                              },
                            ),
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4.0)),
                              elevation: 0.0,
                              minimumSize: Size.zero,
                              padding: EdgeInsets.zero,
                              backgroundColor: AppColors.primary,
                            ),
                            child: const Text("추가",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 12)),
                          ),
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) =>
                      divider(),
                );
              },
            ),
            StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection(FirestoreCollections.generalCourses)
                  .orderBy('name', descending: false)
                  .snapshots(),
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }

                final docs = snapshot.data!.docs;
                var searchedList = [];
                for (var element in docs) {
                  if ((element.data()['name'] as String)
                      .contains(myController.text)) {
                    searchedList.add(element);
                  }
                }

                return ListView.separated(
                  shrinkWrap: true,
                  itemCount: searchedList.length,
                  itemBuilder: (context, index) {
                    return SizedBox(
                      height: 79,
                      child: ListTile(
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 24, vertical: 10),
                        leading: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              searchedList[index]['name'],
                              style: const TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 13),
                            ),
                            const Padding(padding: EdgeInsets.only(top: 4)),
                            Text(
                              '${searchedList[index]['credit']}학점, 성적산출(Grade/PF): ${searchedList[index]['gradeOrPf']}\n${searchedList[index]['category']}, ${searchedList[index]['type']}',
                              style: const TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 11,
                                  color: AppColors.mutedText,
                                  height: 1.4),
                            ),
                          ],
                        ),
                        trailing: SizedBox(
                          height: 30,
                          width: 44,
                          child: ElevatedButton(
                            onPressed: () => showDialog<void>(
                              context: context,
                              barrierDismissible: false,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  elevation: 0.0,
                                  backgroundColor: Colors.white,
                                  title: const Padding(
                                      padding: EdgeInsets.only(bottom: 7),
                                      child: Text('강의를 추가하시겠습니까?',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w700,
                                          ))),
                                  actions: [
                                    TextButton(
                                        style: TextButton.styleFrom(
                                          minimumSize: Size.zero,
                                          padding: EdgeInsets.zero,
                                          tapTargetSize:
                                              MaterialTapTargetSize.shrinkWrap,
                                        ),
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: const Text("취소",
                                            style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 14))),
                                    const Padding(
                                        padding: EdgeInsets.only(right: 7)),
                                    TextButton(
                                        style: TextButton.styleFrom(
                                          minimumSize: Size.zero,
                                          padding: EdgeInsets.zero,
                                          tapTargetSize:
                                              MaterialTapTargetSize.shrinkWrap,
                                        ),
                                        onPressed: () async {
                                          bool duplicated = await UserController
                                              .to
                                              .checkDuplicated(
                                                  searchedList[index].data());
                                          if (!duplicated) {
                                            await UserController.to
                                                .addCourseData(
                                                    searchedList[index].data(),
                                                    courseLanguage ==
                                                            CourseLanguage
                                                                .english
                                                        ? true
                                                        : false,
                                                    courseGradeType ==
                                                            CourseGradeType
                                                                .grade
                                                        ? "G"
                                                        : "PF",
                                                    arguments['semester']);
                                            Get.offNamed('/navigation');
                                          } else {
                                            Get.back();
                                            Get.snackbar(
                                                "과목 추가 실패", "이미 추가한 과목입니다.");
                                          }
                                        },
                                        child: const Text("추가",
                                            style: TextStyle(
                                                color: AppColors.primary,
                                                fontSize: 14))),
                                  ],
                                  content: StatefulBuilder(builder:
                                      (BuildContext context,
                                          StateSetter setState) {
                                    return Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text(
                                            '[교양] ${searchedList[index]['name']}\n${searchedList[index]['credit']}학점, 성적산출(Grade/PF): ${searchedList[index]['gradeOrPf']}\n${searchedList[index]['category']}, ${searchedList[index]['type']}',
                                            textAlign: TextAlign.center,
                                            style:
                                                const TextStyle(fontSize: 12)),
                                        const Padding(
                                            padding:
                                                EdgeInsets.only(bottom: 10)),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Row(
                                              children: [
                                                Radio(
                                                    splashRadius: 0.0,
                                                    activeColor:
                                                        AppColors.primary,
                                                    materialTapTargetSize:
                                                        MaterialTapTargetSize
                                                            .shrinkWrap,
                                                    value:
                                                        CourseLanguage.korean,
                                                    groupValue: courseLanguage,
                                                    onChanged: (value) {
                                                      setState(() =>
                                                          courseLanguage =
                                                              value);
                                                    }),
                                                const Text("한국어분반",
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontSize: 12)),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                Radio(
                                                    splashRadius: 0.0,
                                                    activeColor:
                                                        AppColors.primary,
                                                    materialTapTargetSize:
                                                        MaterialTapTargetSize
                                                            .shrinkWrap,
                                                    value:
                                                        CourseLanguage.english,
                                                    groupValue: courseLanguage,
                                                    onChanged: (value) {
                                                      setState(() =>
                                                          courseLanguage =
                                                              value);
                                                    }),
                                                const Text("영어분반",
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontSize: 12)),
                                              ],
                                            ),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Row(
                                              children: [
                                                Radio(
                                                    splashRadius: 0.0,
                                                    activeColor:
                                                        AppColors.primary,
                                                    materialTapTargetSize:
                                                        MaterialTapTargetSize
                                                            .shrinkWrap,
                                                    value:
                                                        CourseGradeType.grade,
                                                    groupValue: courseGradeType,
                                                    onChanged: (value) {
                                                      setState(() =>
                                                          courseGradeType =
                                                              value);
                                                    }),
                                                const Text("Grade 성적",
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontSize: 12)),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                Radio(
                                                    splashRadius: 0.0,
                                                    activeColor:
                                                        AppColors.primary,
                                                    materialTapTargetSize:
                                                        MaterialTapTargetSize
                                                            .shrinkWrap,
                                                    value: CourseGradeType
                                                        .passFail,
                                                    groupValue: courseGradeType,
                                                    onChanged: (value) {
                                                      setState(() =>
                                                          courseGradeType =
                                                              value);
                                                    }),
                                                const Text("P/F 성적",
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontSize: 12)),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ],
                                    );
                                  }),
                                );
                              },
                            ),
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4.0)),
                              elevation: 0.0,
                              minimumSize: Size.zero,
                              padding: EdgeInsets.zero,
                              backgroundColor: AppColors.primary,
                            ),
                            child: const Text("추가",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 12)),
                          ),
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) =>
                      divider(),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
