import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
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
            '나의 수강 현황',
            style: TextStyle(
              fontWeight: FontWeight.w800,
              fontSize: 20,
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: SizedBox(
              width: 33,
              height: 33,
              // Inkwell
              child: InkWell(
                radius: 33,
                onTap: () {
                  Get.toNamed('/mypage');
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
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              // 신앙 및 세계관
              categoryTitle('신앙및세계관'),
              scoreInfo('남은 학점', 6, 9),
              divider(),
              takeCSinfo('수강 완료', cmplt),
              divider(),
              takeCSinfo('수강 예정', notcmplt),

              // 인성 및 리더십
              categoryTitle('인성및리더십'),
              scoreInfo('남은 학점', 3, 6),
              divider(),
              takeCSinfo('수강 완료', cmplt),
              divider(),
              takeCSinfo('수강 예정', notcmplt),

              // 실무 영어
              categoryTitle('실무영어'),
              scoreInfo('남은 학점', 6, 9),
              divider(),
              takeCSinfo('수강 완료', cmplt),
              divider(),
              takeCSinfo('수강 예정', notcmplt),

              // 전문 교양
              categoryTitle('전문교양'),
              scoreInfo('남은 학점', 5, 5),
              divider(),
              takeCSinfo('수강 완료', cmplt),
              divider(),
              takeCSinfo('수강 예정', notcmplt),

              // BSM
              categoryTitle('BSM'),
              scoreInfo('남은 학점', 8, 18),
              divider(),
              takeCSinfo('수강 완료', cmplt),
              divider(),
              takeCSinfo('수강 예정', notcmplt),

              // ICT 융합 기초
              categoryTitle('ICT융합기초'),
              scoreInfo('남은 학점', 2, 2),
              divider(),
              takeCSinfo('수강 완료', cmplt),
              divider(),
              takeCSinfo('수강 예정', notcmplt),

              // 자유선택 (교양)
              categoryTitle('자유선택(교양)'),
              scoreInfo('남은 학점', 6, 9),
              divider(),
              takeCSinfo('수강 완료', cmplt),
              divider(),
              takeCSinfo('수강 예정', notcmplt),

              // 자유선택 (교양 또는 비교양)
              categoryTitle('자유선택(교양또는비교양)'),
              scoreInfo('남은 학점', 6, 12),
              divider(),
              takeCSinfo('수강 완료', cmplt),
              divider(),
              takeCSinfo('수강 예정', notcmplt),

              // 전공 주제
              categoryTitle('전공주제'),
              scoreInfo('남은 학점', 35, 60),
              divider(),
              takeCSinfo('수강 완료', cmplt),
              divider(),
              takeCSinfo('수강 예정', notcmplt),

              // P/F 과목 총 이수학점
              categoryTitle('P/F과목 총이수학점'),
              scoreInfo('남은 학점', 16, 39),
              divider(),
              takeCSinfo('수강 완료', cmplt),
              divider(),
              takeCSinfo('수강 예정', notcmplt),

              // 총 취득학점
              categoryTitle('총 취득학점'),
              scoreInfo('취득 학점', 88, 130),

              // 평점 평균
              categoryTitle('평점 평균'),
              scoreInfo('평점 평균', 39, 45),

              // 영어강의 과목 이수
              categoryTitle('영어강의 과목이수'),
              scoreInfo('전공 영어', 12, 21),
              divider(),
              takeCSinfo('전공 수강 완료', cmplt),
              divider(),
              takeCSinfo('전공 수강 예정', notcmplt),
              divider(),
              scoreInfo('교양 영어', 3, 6),
              divider(),
              takeCSinfo('교양 수강 완료', cmplt),
              divider(),
              takeCSinfo('교양 수강 예정', notcmplt),
              divider(),
              scoreInfo('자유 영어', 0, 3),
              divider(),
              takeCSinfo('자유 수강 완료', cmplt),
              divider(),
              takeCSinfo('자유 수강 예정', notcmplt),

              // 졸업영어시험 제출 여부
              categoryTitle('졸업영어시험 제출 여부'),
              showCond('졸업영어시험 제출', '합격'),

              // 학부 추가 졸업 요건
              categoryTitle('학부추가졸업요건'),
              showCond('학부 추가 졸업 요건', '불합격'),

              // 공학인증 최종 졸업판정
              categoryTitle('공학인증 최종 졸업판정'),
              showCond('졸업 판정', '졸업 불가능'),
            ],
          ),
        ],
      ),
    );
  }
}

Widget categoryTitle(String title) {
  // 졸업 요건 항목 카테고리
  return Stack(
    alignment: AlignmentDirectional.bottomStart,
    children: [
      Container(
        height: 30,
        color: const Color(0xFFEFEFF4),
      ),
      Padding(
        padding: const EdgeInsets.only(left: 24, bottom: 5),
        child: Text(title, style: const TextStyle(fontSize: 10)),
      ),
    ],
  );
}

Widget divider() {
  return const Divider(
    thickness: 1,
    color: Color(0xffC4C4C4),
    height: 0,
  );
}

Widget scoreInfo(String type, int left, int full) {
  return ListTile(
    contentPadding: const EdgeInsets.symmetric(horizontal: 24),
    leading: Text(
      type,
      style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 15),
    ),
    trailing: RichText(
        text: TextSpan(children: [
      TextSpan(
        text: '$left ',
        style: const TextStyle(
            fontWeight: FontWeight.w800,
            fontSize: 15,
            color: Color(0xffFFC107)),
      ),
      TextSpan(
        text: '/ $full학점',
        style: const TextStyle(
            fontWeight: FontWeight.w800, fontSize: 15, color: Colors.black),
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
          style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 15),
        ),
        Text(
          showList,
          textAlign: TextAlign.end,
          style: const TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 15,
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
          style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 15),
        ),
        Text(
          cond,
          textAlign: TextAlign.end,
          style: TextStyle(
              fontWeight: FontWeight.w800,
              fontSize: 15,
              color: color,
              height: 1.1),
        ),
      ],
    ),
  );
}
