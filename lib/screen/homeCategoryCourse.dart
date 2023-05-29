
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeCategoryCourse extends StatefulWidget {
  const HomeCategoryCourse({super.key});

  @override
  State<HomeCategoryCourse> createState() => HomeCategoryCourseState();
}

class HomeCategoryCourseState extends State<HomeCategoryCourse> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Padding(
          padding: EdgeInsets.symmetric(horizontal: 8),
          child: Text(
            Get.arguments['title'],
            style: TextStyle(
              fontWeight: FontWeight.w800,
              fontSize: 16,
            ),
          ),
        ),
      ),
    body: StreamBuilder<QuerySnapshot>(
      stream: Get.arguments["snapshots"],
      builder: (context, AsyncSnapshot<QuerySnapshot> snapshot){
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        }

        final courses = snapshot.data?.docs;

        return ListView.separated(
            itemCount: courses!.length,
            itemBuilder: (BuildContext context, int index){
              return ListTile(
                visualDensity: const VisualDensity(vertical: -3),
                contentPadding: const EdgeInsets.symmetric(horizontal: 24),
                leading: Text(courses[index]["name"],
                  style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
                ),
              );
        },
            separatorBuilder: (context, index) => const Divider(
              thickness: 1,
              color: Color(0xffC4C4C4),
              height: 0,
            ),
        );
      }
    ),
    );
  }
}