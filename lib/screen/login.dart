import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget{
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff00579C),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 250, height: 302,
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/logo.png"),
                    fit: BoxFit.cover
                ),
              ),
            ),
            const SizedBox(height: 149),
            InkWell(
              onTap: (){
                // TODO
              },
              child: Container(
                  width: 330, height: 54,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      color: const Color(0xffFFFFFF)
                  ),
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 24, height: 24,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("assets/images/googleIcon.png"),
                              fit: BoxFit.cover
                          ),
                        ),
                      ),
                      const SizedBox(width: 32),
                      const Text('구글로 로그인하기',
                        style: TextStyle(
                          color: Color(0xff00579C),
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  )
              ),
            ),
            const SizedBox(height: 16),
            const Text('@handong.ac.kr 계정으로만\n로그인이 가능합니다.',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xffFFFFFF),
                fontSize: 13,
              ),
            )
          ],
        ),
      )
    );
  }
}