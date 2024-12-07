import 'package:flutter/material.dart';
import 'package:syn_laundry/pages/beranda_page.dart';
import 'package:syn_laundry/pages/list_order_page.dart';
import 'package:syn_laundry/pages/profil_page.dart';
import 'package:syn_laundry/pages/success_page.dart';

import '../themes/themes.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  // siapkan variabel sbg wadah nilai awal index
  int selectedIndex = 0;

  // siapkan variabel utk menampung screen/page yg akan dipakai
  static List<Widget> screenList = [
    BerandaPage(), // index 0
    ListOrderPage(), // index 1
    ProfilPage(), // index 2
  ];

  // buat fungsi tap
  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          // index 0
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Beranda"),

          // index 1
          BottomNavigationBarItem(icon: Icon(Icons.task), label: "Pesanan"),

          // index 2
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profil"),
        ],

        // atribut konfigurasi bottomnavigationbarnya
        currentIndex: selectedIndex, // index yg terpilih
        selectedItemColor: primaryColor, // warna saat item terpilih
        unselectedItemColor: greyColor, // warna saat item tidak terpilih
        onTap: onItemTapped, // saat item ditap
        backgroundColor: whiteColor, // warna background
        type: BottomNavigationBarType.fixed, // tipe bottomnavigationbar
      ),
      body: screenList.elementAt(selectedIndex),
    );
  }
}
