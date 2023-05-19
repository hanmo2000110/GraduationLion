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
      appBar: AppBar(
        forceMaterialTransparency: true,
        backgroundColor: Colors.white,
        title: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 8),
          child: Text(
            'MyPage',
            style: TextStyle(
              fontWeight: FontWeight.w800,
              fontSize: 20,
            ),
          ),
        ),
        centerTitle: false,
        elevation: 0.0,
      ),
      body: ListView(
        children: const [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Text('My Page'),
            ],
          ),
        ],
      ),
    );
  }
}
