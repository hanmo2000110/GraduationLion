import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:graduationlion/controller/coursecontroller.dart';
import 'recommend.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MyPage extends StatefulWidget {
  const MyPage({super.key});

  @override
  State<MyPage> createState() => MyPageState();
}

class MyPageState extends State<MyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              profile('졸업사자'),
              currentState(45),
              for (int i=1 ; i<=8 ; i++)
                Column(
                  children: [
                    semesterWithAdd(i),
                    StreamBuilder(
                      stream: FirebaseFirestore.instance
                          .collection("Users")
                          .doc(FirebaseAuth.instance.currentUser?.email)
                          .collection("Courses")
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

                        var semesterCourseList = [];
                        for (var element in docs) {
                          if ((element.data()['semester'] as String)
                              .contains("$i")) {
                            semesterCourseList.add(element);
                          }
                        }

                        return ListView.separated(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: semesterCourseList.length,
                          itemBuilder: (context, index) {
                            String courseLanguage = '';
                            if(semesterCourseList[index]['isEnglish'] == true) {
                              courseLanguage = "[영]";
                            } else {
                              courseLanguage = "[한]";
                            }

                            return Slidable(
                              endActionPane: ActionPane(
                                extentRatio: 0.2,
                                motion: const ScrollMotion(),
                                children: [
                                  SlidableAction(
                                      icon: Icons.delete,
                                      backgroundColor: Colors.red,
                                      foregroundColor: Colors.white,
                                      onPressed: (context) async{
                                        //Get.find<CourseController>.deleteCourse();
                                      })
                                ],
                              ),
                              child: ListTile(
                                visualDensity: const VisualDensity(vertical: -3),
                                contentPadding: const EdgeInsets.symmetric(horizontal: 24),
                                leading: Text(
                                  semesterCourseList[index]['name'],
                                  style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
                                ),
                                trailing: Text(
                                  '$courseLanguage ${semesterCourseList[index]['credit']}학점, ${semesterCourseList[index]['gradeOrPf']}',
                                  textAlign: TextAlign.end,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14,
                                      color: Color(0xff8B95A1),
                                      height: 1.1),
                                ),
                              ),
                            );
                          },
                          separatorBuilder: (BuildContext context, int index) => divider(),
                        );
                      },
                    ),
                  ],
                ),
            ],
          ),
        ],
      ),
    );
  }
}

Widget profile(String nickname) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 33),
    child: Row(
      children: [
        Container(
          margin: const EdgeInsets.only(right: 24),
          width: 80,
          height: 80,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            border: Border.all(
              color: const Color(0xffD4D1CE),
              width: 3,
            ),
          ),
          child: InkWell(
            child: Image.asset('assets/images/profile.png'),
            onTap: () => CourseController.to.addData(),
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '$nickname 학우님',
              style: const TextStyle(fontSize: 12, color: Color(0xff777777)),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 7),
            ),
            const Text(
              '열심히 달려오고 계시군요.\n조금만 더 힘내봐요, 파이팅!',
              style: TextStyle(
                  height: 1.2,
                  fontSize: 14,
                  color: Colors.black,
                  fontWeight: FontWeight.w800),
            ),
          ],
        ),
      ],
    ),
  );
}

Widget currentState(int state) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 24),
    child: Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                    text: TextSpan(children: [
                  const TextSpan(
                    text: '현재 졸업사자와의 거리는 ',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.black),
                  ),
                  TextSpan(
                    text: '${100 - state}km',
                    style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Color(0xff00579C)),
                  ),
                  const TextSpan(
                    text: '\n아래에서 자세한 현황을 확인해보세요.',
                    style: TextStyle(
                        height: 2.5,
                        fontSize: 11,
                        fontWeight: FontWeight.w400,
                        color: Color(0xff777777)),
                  ),
                ])),
              ],
            ),
            Text(
              '${(state)}%',
              style: const TextStyle(
                  height: 0,
                  fontSize: 33,
                  color: Color(0xff00579C),
                  fontWeight: FontWeight.w800),
            ),
          ],
        ),
        Container(
          margin: const EdgeInsets.symmetric(vertical: 30),
          height: 4,
          child: LinearProgressIndicator(
            value: state.toDouble() / 100,
            valueColor: const AlwaysStoppedAnimation<Color>(Color(0xff00579C)),
            backgroundColor: const Color(0xffD4D1CE),
          ),
        ),
      ],
    ),
  );
}

Widget semesterWithAdd(int semester) {
  // 학기 수 + 추가 버튼
  return Stack(
    alignment: AlignmentDirectional.center,
    children: [
      Container(
        height: 30,
        color: const Color(0xFFEFEFF4),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 24),
            child: Text('$semester학기', style: const TextStyle(fontSize: 10)),
          ),
          Container(
                height: 19,
                width: 42,
                margin: const EdgeInsets.only(left: 10, right: 24),
                child: ElevatedButton(
                  onPressed: () {
                    Get.toNamed('/addcourse',
                        arguments: ({"semester": semester.toString()}));
                  },
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4.0)),
                      elevation: 0.0,
                      minimumSize: Size.zero,
                      padding: EdgeInsets.zero,
                      backgroundColor: const Color(0xff8B95A1),
                      textStyle: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 12)),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.add,
                        size: 14,
                        color: Colors.white,
                      ),
                      Text("추가",
                          style: TextStyle(
                              height: 1.3,
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 10.5)),
                    ],
                  ),
                ),
              ),
        ],
      ),
    ],
  );
}
