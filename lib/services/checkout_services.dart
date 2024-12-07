import 'dart:convert';

import 'package:syn_laundry/config/config.dart';
import 'package:syn_laundry/models/Checkout_model.dart';
import 'package:http/http.dart' as http;

class CheckoutServices {
  //function menampilkan list checkout
  Future<List<Checkoutmodel>> listCheckoutBaru(String userId) async {
    //siapkan variabel untuk menampung/menyimpan list checkout
    List<Checkoutmodel> listCheckoutBaru = [];

    try {
      //variabel untuk menampung url endpoint
      var url = Config().checkoutListBaru;
      //buat variabel untuk request ke web service
      var response = await http.get(Uri.parse(url + userId));

      //jika status codenya 200
      if (response.statusCode == 200) {
        // ambil isi body dari output json dan decde jsonnya
        var responseBody = json.decode(response.body);
        // simpan hasil response body kedalam variabel
        List listCheckoutBaruResponse = responseBody["data"];

        //masukkan hasil response body yang telah didapat kedalam variabel listcheckoutbaru
        listCheckoutBaruResponse.forEach((data) {
          listCheckoutBaru.add(Checkoutmodel.fromJson(data));
        });
      } else {
        listCheckoutBaru = [];
      }
    } catch (e) {
      print(e);
    }
    return listCheckoutBaru;
  }

  Future<List<Checkoutmodel>> listCheckoutProses(String userId) async {
    //siapkan variabel untuk menampung/menyimpan list checkout
    List<Checkoutmodel> listCheckoutProses = [];

    try {
      //variabel untuk menampung url endpoint
      var url = Config().checkoutListProses;
      //buat variabel untuk request ke web service
      var response = await http.get(Uri.parse(url + userId));

      //jika status codenya 200
      if (response.statusCode == 200) {
        // ambil isi body dari output json dan decde jsonnya
        var responseBody = json.decode(response.body);
        // simpan hasil response body kedalam variabel
        List listCheckoutProsesResponse = responseBody["data"];

        //masukkan hasil response body yang telah didapat kedalam variabel listcheckoutbaru
        listCheckoutProsesResponse.forEach((data) {
          listCheckoutProses.add(Checkoutmodel.fromJson(data));
        });
      } else {
        listCheckoutProses = [];
      }
    } catch (e) {
      print(e);
    }
    return listCheckoutProses;
  }

  Future<List<Checkoutmodel>> listCheckoutSelesai(String userId) async {
    //siapkan variabel untuk menampung/menyimpan list checkout
    List<Checkoutmodel> listCheckoutSelesai = [];

    try {
      //variabel untuk menampung url endpoint
      var url = Config().checkoutListSelesai;
      //buat variabel untuk request ke web service
      var response = await http.get(Uri.parse(url + userId));

      //jika status codenya 200
      if (response.statusCode == 200) {
        // ambil isi body dari output json dan decde jsonnya
        var responseBody = json.decode(response.body);
        // simpan hasil response body kedalam variabel
        List listCheckoutSelesaiResponse = responseBody["data"];

        //masukkan hasil response body yang telah didapat kedalam variabel listcheckoutbaru
        listCheckoutSelesaiResponse.forEach((data) {
          listCheckoutSelesai.add(Checkoutmodel.fromJson(data));
        });
      } else {
        listCheckoutSelesai = [];
      }
    } catch (e) {
      print(e);
    }
    return listCheckoutSelesai;
  }
}
