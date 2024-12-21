import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syn_laundry/config/config.dart';
import 'package:syn_laundry/models/Product_model.dart';
import 'package:http/http.dart' as http;
import 'package:sp_util/sp_util.dart';
import 'package:syn_laundry/pages/beranda_page.dart';
import 'package:syn_laundry/pages/info_cucian_page.dart';
import 'package:syn_laundry/pages/info_pesanan_page.dart';
import 'package:syn_laundry/pages/landing_page.dart';

class CartController extends GetxController {
  TextEditingController namaLengkap =
      TextEditingController(text: SpUtil.getString("name"));
  TextEditingController noHP =
      TextEditingController(text: SpUtil.getString("telepon"));
  TextEditingController alamat = TextEditingController();
  TextEditingController jumlah = TextEditingController();

  // function post Cart
  Future postCartNow(ProductModel dataProduct) async {
    var url = Uri.parse(Config().keranjangPost);
    var url2 = Uri.parse(Config().checkoutPostById);

    try {
      //1. proses input keranjang
      final response = await http.post(url, body: {
        'product_id': dataProduct.id.toString(),
        'user_id': SpUtil.getInt("id_user").toString(),
        'jumlah': jumlah.text,
      });

      var responseDecode = json.decode(response.body);
      print(responseDecode);
      if (response.statusCode == 200) {
        // tampung bbrp data hasil dri json
        var idCart = responseDecode["data"]["id"];
        print(idCart);
        // var jumlahBeli = responseDecode["data"]["jumlah"];
        // var totalharga = responseDecode["data"]["totalharga"];

        // proses input checkout
        final response2 = await http.post(url2, body: {
          'keranjang_id': idCart.toString(),
          'user_id': SpUtil.getInt("id_user").toString(),
          'nama': namaLengkap.text,
          'nohp': noHP.text,
          'alamat': alamat.text,
          'jenis_pembayaran': "TF",
        });

        var responseDecode2 = json.decode(response2.body);

        if (response2.statusCode == 200) {
          // tampilkan snackbar
          Get.snackbar("Success", responseDecode2["message"],
              duration: Duration(seconds: 5));
          // arahkan ke beranda
          Get.offAll(LandingPage());
        } else {
          Get.snackbar("Failed", responseDecode2["message"],
              duration: Duration(seconds: 5));
        }
      } else {
        Get.snackbar("Failed", responseDecode["message"],
            duration: Duration(seconds: 5));
      }
    } catch (e) {
      Get.snackbar("Failed", e.toString(), duration: Duration(seconds: 5));
    }
  }
}
