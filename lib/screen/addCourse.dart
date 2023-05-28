import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../controller/userController.dart';
import 'home.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class addCoursePage extends StatefulWidget {
  const addCoursePage({super.key});

  @override
  State<addCoursePage> createState() => addCoursePageState();
}

class addCoursePageState extends State<addCoursePage> {
  @override
  Widget build(BuildContext context) {
    var arguments = Get.arguments;
    return Scaffold(
        appBar: AppBar(
          scrolledUnderElevation: 0.0,
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
                    hintText: '[전공] 강의명 입력',
                      hintStyle: TextStyle(color: Colors.white),
                  ),

          ),
          ),
        ),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('Courses')
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
          return ListView.separated(
            shrinkWrap: true,
            itemCount: docs.length,
            itemBuilder: (context, index) {
              return SizedBox(
                height: 69,
                child: ListTile(
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
                  leading: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        docs[index]['name'],
                        style: const TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 13),
                      ),
                      const Padding(padding: EdgeInsets.only(top: 4)),
                      Text(
                        '${docs[index]['credit']}학점 (설계 ${docs[index]['design']}학점), ${docs[index]['type']}',
                        style: const TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 11,
                            color: Color(0xff8B95A1),
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
                        return CupertinoAlertDialog(
                          title: const Padding(
                            padding: EdgeInsets.only(bottom: 7),
                              child: Text('강의를 추가하시겠습니까?', style: TextStyle(fontSize: 14))),
                          actions: [
                            CupertinoDialogAction(onPressed: (){
                              Navigator.of(context).pop();
                            }, child: const Text("취소", style: TextStyle(color: Colors.grey, fontSize: 14))),
                            CupertinoDialogAction( onPressed: () async {
                                    await UserController.to.addCourseData(
                                        docs[index].data(),
                                        true,
                                        "G",
                                        arguments['semester']);
                                    Get.offNamed('/navigation');
                                  }, child: const Text("추가", style: TextStyle(color: Color(0xff00579C), fontSize: 14))),
                          ],
                          content: Column(
                            children: [
                              Text('[전공] ${docs[index]['name']}\n${docs[index]['credit']}학점 (설계 ${docs[index]['design']}학점), ${docs[index]['type']}', style: const TextStyle(fontSize: 12)),
                            ],
                          ),
                        );
                      },
                    ),
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4.0)
                          ),
                        elevation: 0.0,
                        minimumSize: Size.zero,
                        padding: EdgeInsets.zero,
                        backgroundColor: const Color(0xff00579C),
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
            separatorBuilder: (BuildContext context, int index) => divider(),
          );
        },
      ),
    );
  }
}
