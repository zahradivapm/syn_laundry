import 'package:flutter/material.dart';

import '../themes/themes.dart';

class EditProfilPage extends StatelessWidget {
  const EditProfilPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Edit Profil",
          style: primaryTextStyle.copyWith(fontWeight: FontWeight.w500),
        ),
        leading: Container(
          margin: EdgeInsets.only(left: 10),
          child: Image.asset(
            'assets/ic-back.png',
            width: 36,
            height: 36,
          ),
        ),
      ),
      body: Container(
        margin: EdgeInsets.only(top: 24, left: 20, right: 20),
        child: ListView(
          children: [
            TextFormField(
              // maxLines: 4,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                hintText: "Nama Lengkap",
                hintStyle: secondaryTextStyle,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(
                    color: greyColor,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(
                    color: greyColor,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 24,
            ),
            TextFormField(
              readOnly: true,
              // maxLines: 4,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                hintText: "Email",
                hintStyle: secondaryTextStyle,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(
                    color: greyColor,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(
                    color: greyColor,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 24,
            ),
            TextFormField(
              // maxLines: 4,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                hintText: "Nomer Telepon",
                hintStyle: secondaryTextStyle,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(
                    color: greyColor,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(
                    color: greyColor,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        margin: EdgeInsets.only(bottom: 24, left: 20, right: 20),
        width: double.infinity,
        height: 50,
        child: TextButton(
          style: TextButton.styleFrom(
            backgroundColor: primaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          onPressed: () {
            null;
          },
          child: Text(
            "Update",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
