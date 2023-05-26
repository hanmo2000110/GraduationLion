import 'package:flutter/material.dart';
import 'home.dart';

class addCoursePage extends StatefulWidget {
  const addCoursePage({super.key});

  @override
  State<addCoursePage> createState() => addCoursePageState();
}

class addCoursePageState extends State<addCoursePage> {
  List<Map<String, String>> searchResult = [
    {
      'course': '데이타구조',
      'grade': '3학점',
      'english': '0',
      'designGrade': '0학점',
    },
    {
      'course': '데이타구조',
      'grade': '3학점',
      'english': '0',
      'designGrade': '0학점',
    },
    {
      'course': '데이타구조',
      'grade': '3학점',
      'english': '0',
      'designGrade': '0학점',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leadingWidth: 30,
          title: const SizedBox(
        height: 40,
        child:
        TextField(
              cursorColor: Colors.white,
            style: TextStyle(fontSize: 15, decorationThickness: 0, color: Colors.white),
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search, color: Colors.white),
                    filled: true,
                    fillColor: Color(0xffC4C4C4),
                    contentPadding: EdgeInsets.symmetric(
                      vertical: 8,
                      horizontal: 16,
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 1, color: Color(0xffC4C4C4)),
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 1, color: Color(0xffC4C4C4)),
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    hintText: '과목명 입력',
                      hintStyle: TextStyle(color: Colors.white),
                  ),

          ),
          ),
        ),
      body: ListView.separated(
        shrinkWrap: true,
        itemCount: searchResult.length,
        itemBuilder: (context, i) {
          return SizedBox(
            height: 75,
            child: ListTile(
            contentPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
            leading: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${searchResult[i]['course']}',
                  style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 13),
                ),
                const Padding(padding: EdgeInsets.only(top: 4)),
                Text(
                  '학점: ${searchResult[i]['grade']} (설계 ${searchResult[i]['designGrade']})\n영어비율: ${searchResult[i]['english']}%',
                  style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 11,
                      color: Color(0xff8B95A1),
                      height: 1.4),
                ),
              ],
            ),
              trailing: Container(
                margin: const EdgeInsets.only(bottom: 28),
                height: 19,
                width: 45,
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
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) => divider(),
      ),
    );
  }
}