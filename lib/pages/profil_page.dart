import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syn_laundry/controllers/auth_controller.dart';
import 'package:syn_laundry/pages/edit_profil_page.dart';
import 'package:syn_laundry/pages/reset_password_page.dart';
import 'package:syn_laundry/pages/splash_page.dart';
import 'package:syn_laundry/themes/themes.dart';
import 'package:sp_util/sp_util.dart';

class ProfilPage extends StatelessWidget {
  ProfilPage({super.key});

  // panggil controller AuthController (krn kita akan memanggil function logout yg ada di AuthController)
  final authC = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Profil Saya",
          style: primaryTextStyle.copyWith(
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: Container(
        margin: EdgeInsets.only(left: 20, right: 20),
        child: ListView(
          children: [
            Align(
              alignment: Alignment.bottomRight,
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => EditProfilPage()));
                },
                child: Text(
                  "Edit Profil",
                  style: greenTextStyle,
                ),
              ),
            ),
            SizedBox(
              height: 41,
            ),
            Text(
              "Username",
              style: primaryTextStyle.copyWith(
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(
              height: 14,
            ),
            Text(
              SpUtil.getString("name").toString(),
              style: primaryTextStyle.copyWith(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(
              height: 14,
            ),
            Text(
              "Email",
              style: primaryTextStyle.copyWith(
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(
              height: 14,
            ),
            Text(
              SpUtil.getString("email").toString(),
              style: primaryTextStyle.copyWith(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(
              height: 14,
            ),
            Text(
              "Nomer Telepon",
              style: primaryTextStyle.copyWith(
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(
              height: 14,
            ),
            Text(
              SpUtil.getString("telepon").toString(),
              style: primaryTextStyle.copyWith(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(
              height: 39,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ResetPasswordPage()));
              },
              child: Row(
                children: [
                  Text(
                    "Reset Password",
                    style: primaryTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Spacer(),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 24,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 39,
            ),
            GestureDetector(
                onTap: () {
                  // memnunculkan Alert
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return Expanded(
                        child: AlertDialog(
                          //title: const Text('Button Clicked!'),
                          content: Text(
                            'Yakin ingin keluar akun?',
                            style: primaryTextStyle.copyWith(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          actions: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  margin: EdgeInsets.only(
                                      bottom: 24, left: 20, right: 20),
                                  width: double.infinity,
                                  height: 50,
                                  child: TextButton(
                                    style: TextButton.styleFrom(
                                      backgroundColor: Color(0xFF4ABF92),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                    ),
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: Text(
                                      "Batalkan",
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            GestureDetector(
                              onTap: () {
                                authC.logout();
                              },
                              child: Center(
                                child: Obx(() => authC.loading == true
                                    ? Text(
                                        "Loading....",
                                        style: redTextStyle.copyWith(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      )
                                    : Text(
                                        "Yakin, keluar",
                                        style: redTextStyle.copyWith(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      )),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
                child: Text(
                  "Logout",
                  style: redTextStyle.copyWith(fontSize: 16),
                )),
          ],
        ),
      ),
    );
  }
}
