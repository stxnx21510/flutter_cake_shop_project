// ignore_for_file: use_build_context_synchronously, annotate_overrides

import 'package:flutter/material.dart';
import 'package:flutter_cake_shop_project/views/cake_shop_list_ui.dart';

class SplashScreenUI extends StatefulWidget {
  const SplashScreenUI({super.key});

  @override
  State<SplashScreenUI> createState() => _SplashScreenUIState();
}

class _SplashScreenUIState extends State<SplashScreenUI> {
  void initState() {
    Future.delayed(
      const Duration(seconds: 3),
      () {
        //เปิดหน้า cake list แบบไม่ย้อนกลับ
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const CakeShopListUI(),
          ),
        );
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          //ชั้นแรก แสดงรูป
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/bg_welcome.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          //ฃั้นสอง แสดงชื่อแอป และโปรเกรสหมุน ๆ
          Center(
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.1,
                ),
                Text(
                  'สายด่วนกินเค้ก',
                  style: TextStyle(
                    fontSize: MediaQuery.of(context).size.height * 0.045,
                    color: const Color.fromARGB(255, 255, 2, 2),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'CAKE CALL FAST',
                  style: TextStyle(
                    fontSize: MediaQuery.of(context).size.height * 0.025,
                    color: const Color.fromARGB(255, 255, 66, 66),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.05,
                ),
                CircularProgressIndicator(
                  color: const Color.fromARGB(255, 122, 122, 122),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
