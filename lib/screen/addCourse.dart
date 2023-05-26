import 'package:flutter/material.dart';

class addCoursePage extends StatefulWidget {
  const addCoursePage({super.key});

  @override
  State<addCoursePage> createState() => addCoursePageState();
}

class addCoursePageState extends State<addCoursePage> {
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
    );
  }
}