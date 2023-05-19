import 'package:flutter/material.dart';

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
