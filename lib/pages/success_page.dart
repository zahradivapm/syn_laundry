import 'package:flutter/material.dart';

import '../themes/themes.dart';

class SuccessPage extends StatelessWidget {
  const SuccessPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/img-sukses.png',
              width: 177,
              height: 177,
            ),
            Text(
              'Hore Pesanan Telah\nTerkonfirmasi',
              style: primaryTextStyle.copyWith(
                  fontSize: 18, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            Text(
              'Tim kami akan segera menjemput\ncucianmu mohon ditunggu ya!',
              style: secondaryTextStyle.copyWith(
                fontSize: 18,
                fontStyle: FontStyle.italic,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 23,
            ),
            Container(
              margin: EdgeInsets.all(20),
              width: double.infinity,
              height: 50,
              child: TextButton(
                  style: TextButton.styleFrom(
                      backgroundColor: Color(0xFF4ABF92),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15))),
                  onPressed: null,
                  child: Text(
                    'Lanjut',
                    style: whiteTextStyle.copyWith(fontSize: 16),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
