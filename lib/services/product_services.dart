import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:syn_laundry/config/config.dart';
import 'package:syn_laundry/models/Product_model.dart';

class ProductServices {
  // function utk request data ke API (end point : /product-list)
  static Future<List<ProductModel>> getProductList() async {
    // siapkan variabel utk menyimpan list product
    List<ProductModel> listProduct = [];

    try {
      // buat variabel utk request web service
      var response = await http.get(Uri.parse(Config().productList));

      // jika berhasil mendapatkan data

      if (response.statusCode == 200) {
        // ambil isi body dr response / output json (postman)
        var responseBody = json.decode(response.body);

        // buat variabel utk menampung isi dari response body
        List listAllProductResponse =
            responseBody["data"]; //isinya akan sesuai dengan json di postman

        // isikan variabel listProduct yang tadinya kosong [] dengan isian yg di dapatkan dr variabel listAllProductResponse
        listAllProductResponse.forEach((data) {
          listProduct.add(ProductModel.fromJson(data));
        });
      } else {
        listProduct = [];
      }
    } catch (e) {
      print(e);
    }

    return listProduct;

  }
}
