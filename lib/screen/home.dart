import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:graduationlion/controller/coursecontroller.dart';
import 'package:get/get.dart';
import 'package:graduationlion/controller/requirementController.dart';

import '../controller/userController.dart';
import '../model/gcourseModel.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  final CourseController courseController = Get.find<CourseController>();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      getMajor();
    });
    super.initState();
  }

  String major = '컴공';

  List<String> cmplt = [
    '성경의 이해',
    '창조와 진화',
    '채플(한국어) 1',
    '채플(한국어) 2',
    '기독교의 이해',
    '채플(한국어) 3',
    '채플(한국어) 4'
  ];

  List<String> notcmplt = ['채플(한국어) 5', '신앙특론'];
  var get = RequirementController.to;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        forceMaterialTransparency: true,
        backgroundColor: Colors.white,
        title: Padding(
          padding: EdgeInsets.symmetric(horizontal: 8),
          child: InkWell(
            onTap: () {
              FirebaseAuth.instance.signOut();
            },
            child: Text(
              '나의 수강 현황',
              style: TextStyle(
                fontWeight: FontWeight.w800,
                fontSize: 16,
              ),
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: SizedBox(
              width: 33,
              height: 33,
              child: InkWell(
                radius: 33,
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                            surfaceTintColor: Colors.white,
                            contentPadding:
                                const EdgeInsets.fromLTRB(4, 2, 4, 0),
                            content: Container(
                              width: 340,
                              height: 675,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20)),
                              clipBehavior: Clip.hardEdge,
                              child: SingleChildScrollView(
                                child: Column(
                                  children: [
                                    Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 40),
                                        child: Text(
                                          major.contains('컴공')
                                              ? 'AI·컴퓨터공학심화 졸업요건'
                                              : '전자공학심화 졸업요건',
                                          textAlign: TextAlign.center,
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18),
                                        )),
                                    Image.asset(major.contains('컴공')
                                        ? "assets/images/CS.png"
                                        : "assets/images/EE.png")
                                  ],
                                ),
                              ),
                            ));
                      });
                },
                child: Image.asset('assets/images/profile.png'),
              ),
            ),
          ),
        ],
        centerTitle: false,
        elevation: 0.0,
      ),
      body: ListView(
        children: [
          Obx(
            () => Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Obx(() => setView(courseController.getCategory1(), '신앙 및 세계관',
                    get.credit1, 9, get.list1, notcmplt)),
                setView(courseController.getCategory2(), '인성 및 리더십',
                    get.credit2, 6, get.list2, notcmplt),
                setView(courseController.getCategory3(), '전문 교양', get.credit3,
                    5, get.list3, notcmplt),
                major == "컴공"
                    ? setView(courseController.getCategory4(), '수학 및 기초 과학',
                        get.credit4, 18, get.list4, notcmplt)
                    : setView(
                        courseController.getCategory4_EE(),
                        '수학 및 기초 과학 + ICT 융합 기초',
                        get.credit4,
                        30,
                        get.list4,
                        notcmplt),
                major == "컴공"
                    ? setView(courseController.getCategory5(), 'ICT 융합 기초',
                        get.credit5, 2, get.list5, notcmplt)
                    : Container(),
                setView(
                    courseController.getCategory7(),
                    '실무 영어(EF, EC, ERC, EAP)',
                    get.credit6,
                    12 - UserController.to.englishGrade * 3,
                    get.list6,
                    notcmplt),
                setView(
                    courseController.getCategory6(),
                    '자유 선택 (교양 9학점 + 자유 12학점)',
                    get.credit7,
                    21 + UserController.to.englishGrade * 3,
                    get.list7,
                    notcmplt),

                _setView('전공', get.credit8, 60, get.list8, notcmplt),
                _setView('P/F과목 총 이수 학점', get.credit9, 39, get.list9, notcmplt),

                // 총 취득학점
                categoryTitle('총 취득 학점'),
                scoreInfo('취득 학점', get.totalCredit, 130),

                // // 평점 평균
                // categoryTitle('평점 평균'),
                // scoreInfo('평점 평균', get.credit1, 45),

                // 영어강의 과목 이수
                categoryTitle('영어 강의 과목이수 (전공 21, 교양 6, 자유 3)'),
                scoreInfo('영어 전공 및 교양 ', get.credit10, 30),
                divider(),
                takeCSinfo('수강 완료', get.list10),
                divider(),
                takeCSinfo('수강 예정', notcmplt),

                // 졸업영어시험 제출 여부
                categoryTitle('졸업 영어 시험 제출 여부'),
                showCond('졸업 영어 시험 제출', '합격'),

                // 학부 추가 졸업 요건
                categoryTitle('학부 추가 졸업 요건'),
                showCond('학부 추가 졸업 요건', '불합격'),

                // 공학인증 최종 졸업판정
                categoryTitle('공학인증 최종 졸업 판정'),
                showCond('졸업 판정', '졸업 불가능'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  getMajor() async {
    DocumentReference dr = FirebaseFirestore.instance
        .collection("Users")
        .doc(FirebaseAuth.instance.currentUser?.email);
    await dr.get().then((snapshot) {
      major = snapshot.get("major");
    });
  }
}

Widget setView(List<GCourseModel> get, String category, RxDouble remainA,
    int remainB, List cmplt, List notcmplt) {
  return Column(children: [
    GestureDetector(
      onTap: () {
        Get.toNamed('/homeCategoryCourse',
            arguments: {'title': category, 'snapshots': get});
      },
      child: courseCategoryTitle(category),
    ),
    scoreInfo('남은 학점', remainA, remainB),
    divider(),
    takeCSinfo('수강 완료', cmplt),
    divider(),
    takeCSinfo('수강 예정', notcmplt),
  ]);
}

Widget _setView(
    String category, RxDouble remainA, int remainB, List cmplt, List notcmplt) {
  return Column(children: [
    categoryTitle(category),
    scoreInfo('남은 학점', remainA, remainB),
    divider(),
    takeCSinfo('수강 완료', cmplt),
    divider(),
    takeCSinfo('수강 예정', notcmplt),
  ]);
}

Widget categoryTitle(String title) {
  // 졸업 요건 항목 카테고리
  return Container(
    width: double.infinity,
    height: 30,
    padding: const EdgeInsets.fromLTRB(24, 10, 0, 0),
    color: const Color(0xFFEFEFF4),
    child: Text(title, style: const TextStyle(fontSize: 10)),
  );
}

Widget courseCategoryTitle(String title) {
  return Container(
    width: double.infinity,
    height: 30,
    padding: const EdgeInsets.fromLTRB(24, 10, 0, 0),
    color: const Color(0xFFEFEFF4),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: const TextStyle(fontSize: 10)),
        const Padding(
          padding: EdgeInsets.only(right: 18),
          child: Icon(Icons.arrow_forward_ios_rounded,
              size: 16, color: Colors.grey),
        )
      ],
    ),
  );
}

Widget divider() {
  return const Divider(
    thickness: 1,
    color: Color(0xffC4C4C4),
    height: 0,
  );
}

Widget scoreInfo(String type, RxDouble left, int full) {
  return ListTile(
    contentPadding: const EdgeInsets.symmetric(horizontal: 24),
    leading: Text(
      type,
      style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 14),
    ),
    trailing: RichText(
        text: TextSpan(children: [
      TextSpan(
        text: '${left.value} ',
        style: const TextStyle(
            fontWeight: FontWeight.w800,
            fontSize: 14,
            color: Color(0xffFFC107)),
      ),
      TextSpan(
        text: '/ $full학점',
        style: const TextStyle(
            fontWeight: FontWeight.w800, fontSize: 14, color: Colors.black),
      ),
    ])),
  );
}

Widget takeCSinfo(String cond, List cslist) {
  // 수강 완료, 예정 강의 목록

  var showList = cslist.join("\n");

  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 15),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          cond,
          style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 14),
        ),
        Text(
          showList,
          textAlign: TextAlign.end,
          style: const TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 14,
              color: Color(0xff8B95A1),
              height: 1.1),
        ),
      ],
    ),
  );
}

Widget showCond(String type, String cond) {
  // 합격/불합격 여부

  Color color;

  if (cond == '합격') {
    color = const Color(0xff00579C);
  } else {
    color = const Color(0xffFFC107);
  }

  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 15),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          type,
          style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 14),
        ),
        Text(
          cond,
          textAlign: TextAlign.end,
          style: TextStyle(
              fontWeight: FontWeight.w800,
              fontSize: 14,
              color: color,
              height: 1.1),
        ),
      ],
    ),
  );
}
