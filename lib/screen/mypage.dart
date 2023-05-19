import 'package:flutter/material.dart';
import 'recommend.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

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

              // 학기 별 수강 강의 목록
              // 1학기
              semesterWithAdd('1'),
              courseView('AI 프로젝트 입문', courseDesc1),
              divider(),
              courseView('환경과 인간', courseDesc2),
              divider(),
              courseView('모바일 앱 개발', courseDesc2),
              divider(),
              courseView('Computer Vision', courseDesc1),

              // 2학기
              semesterWithAdd('2'),
              courseView('공학프로젝트 기획', courseDesc1),
              divider(),
              courseView('환경과 인간', courseDesc2),
              divider(),
              courseView('모바일 앱 개발', courseDesc2),
              divider(),
              courseView('Operating System', courseDesc1),

              // 3학기
              semesterWithAdd('3'),
              courseView('AI 프로젝트 입문', courseDesc1),
              divider(),
              courseView('모바일 앱 개발', courseDesc2),
              divider(),
              courseView('환경과 인간', courseDesc2),
              divider(),
              courseView('Computer Network', courseDesc1),

              // 4학기
              semesterWithAdd('4'),
              courseView('AI 프로젝트 입문', courseDesc1),
              divider(),
              courseView('환경과 인간', courseDesc2),
              divider(),
              courseView('모바일 앱 개발', courseDesc2),
              divider(),
              courseView('Computer Vision', courseDesc1),

              // 5학기
              semesterWithAdd('5'),
              courseView('AI 프로젝트 입문', courseDesc1),
              divider(),
              courseView('환경과 인간', courseDesc2),
              divider(),
              courseView('모바일 앱 개발', courseDesc2),
              divider(),
              courseView('Computer Vision', courseDesc1),

              // 6학기
              semesterWithAdd('6'),
              courseView('공학프로젝트 기획', courseDesc1),
              divider(),
              courseView('환경과 인간', courseDesc2),
              divider(),
              courseView('모바일 앱 개발', courseDesc2),
              divider(),
              courseView('Operating System', courseDesc1),

              // 7학기
              semesterWithAdd('7'),
              courseView('AI 프로젝트 입문', courseDesc1),
              divider(),
              courseView('모바일 앱 개발', courseDesc2),
              divider(),
              courseView('환경과 인간', courseDesc2),
              divider(),
              courseView('Computer Network', courseDesc1),

              // 8학기
              semesterWithAdd('8'),
              courseView('AI 프로젝트 입문', courseDesc1),
              divider(),
              courseView('환경과 인간', courseDesc2),
              divider(),
              courseView('Computer Vision', courseDesc1),
              divider(),
              courseView('환경과 인간', courseDesc2),
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
          child: Image.asset('assets/images/profile.png'),
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

Widget semesterWithAdd(String semester) {
  // 학기 수 + 추가 버튼
  return Stack(
    alignment: AlignmentDirectional.center,
    children: [
      Container(
        height: 30,
        color: const Color(0xFFEFEFF4),
      ),
      Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 24),
            child: Text('$semester학기', style: const TextStyle(fontSize: 10)),
          ),
          Container(
            height: 19,
            width: 45,
            margin: const EdgeInsets.only(left: 10),
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
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
                          height: 1,
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 10)),
                ],
              ),
            ),
          ),
        ],
      ),
    ],
  );
}

Widget courseView(String title, List desc) {
  var showList = desc.join(", ");

  return Slidable(
    endActionPane: ActionPane(
      extentRatio: 0.2,
      motion: const ScrollMotion(),
      children: [
        SlidableAction(
          onPressed: (BuildContext context) {},
          backgroundColor: const Color(0xFFFF0000),
          foregroundColor: Colors.white,
          icon: Icons.delete,
        ),
      ],
    ),
    child: ListTile(
      visualDensity: const VisualDensity(vertical: -3),
      contentPadding: const EdgeInsets.symmetric(horizontal: 24),
      leading: Text(
        title,
        style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
      ),
      trailing: Text(
        showList,
        textAlign: TextAlign.end,
        style: const TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 14,
            color: Color(0xff8B95A1),
            height: 1.1),
      ),
    ),
  );
}
