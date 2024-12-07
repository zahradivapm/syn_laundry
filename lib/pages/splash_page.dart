import 'dart:async';
import 'package:get/get.dart';
import 'package:sp_util/sp_util.dart';
import 'package:flutter/material.dart';
import 'package:syn_laundry/pages/landing_page.dart';
import 'package:syn_laundry/pages/login_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  // memanggil fungsi apa yg pertama kali akan dijalankan saat class ini dipanggil
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // panggil function yg akan dijalankan saat class ini dipanggil
    movingPage();
  }

  // fungsi berpindah halaman setelah bbrp detik
  void movingPage() {
    Timer(Duration(seconds: 2), () {
      if (SpUtil.getString("email") == "") {
        // panggil fungsi navigator utk pindah halaman
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => LoginPage()));
      } else {
        Get.offAll(LandingPage());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset('assets/Logo.png'),
      ),
    );
  }
}
