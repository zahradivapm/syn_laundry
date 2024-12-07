import 'package:intl/intl.dart';

class Config {
  // variabel utk menampung url web service (API)
  static String urlAPI = "https://syntop.poltekbangplg.ac.id/api";
  // static String urlAPI = "http://192.168.18.99:8000/api";

  // variabel utk menampung url utama web/backend
  static String urlMain = "https://syntop.poltekbangplg.ac.id/";
  // static String urlMain = "http://192.168.18.99:8000/";

  // urlRegister
  String urlRegister = "$urlAPI/register";
  String urlLogin = "$urlAPI/login";
  String urlLogout = "$urlAPI/logout";

  // urlProduct
  String productList = "$urlAPI/product-list";

  // urlKeranjang
  String keranjangPost = "$urlAPI/keranjang-post";

  // urlCheckout
  String checkoutPostById = "$urlAPI/checkout-post-by-id";
  String checkoutListBaru = "$urlAPI/checkout-list-baru?user_id=";
  String checkoutListProses = "$urlAPI/checkout-list-proses?user_id=";
  String checkoutListSelesai = "$urlAPI/checkout-list-selesai?user_id=";

  // membuat fungsi untuk format currency
  static String convertToIdr(dynamic number, int decimalDigit) {
    NumberFormat currencyFormatter = NumberFormat.currency(
        locale: 'id', symbol: 'IDR. ', decimalDigits: decimalDigit);

    return currencyFormatter.format(number);
  }
}
