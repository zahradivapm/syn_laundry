import 'package:flutter/material.dart';
import 'package:syn_laundry/models/Checkout_model.dart';
import 'package:syn_laundry/themes/themes.dart';

class OrderWidget extends StatelessWidget {
  const OrderWidget({
    super.key,
    required this.dataCheckout,
  });

  final Checkoutmodel dataCheckout;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(top: 16, left: 20, right: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: blackColor,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // KODE
            Text(
              dataCheckout.kodeTransaksi,
              style: primaryTextStyle.copyWith(fontWeight: FontWeight.bold),
            ),
            // BARIS 1
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // SISI KIRI
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Layanan",
                      style: primaryTextStyle.copyWith(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      dataCheckout.item.namaProduct,
                      style: primaryTextStyle.copyWith(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      "Tanggal",
                      style: primaryTextStyle.copyWith(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      "20/10/2024",
                      style: primaryTextStyle.copyWith(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),

                // SISI KANAN
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Paket",
                      style: primaryTextStyle.copyWith(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      dataCheckout.item.merkProduct,
                      style: primaryTextStyle.copyWith(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      "Status",
                      style: primaryTextStyle.copyWith(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      dataCheckout.status == "0"
                          ? "Baru"
                          : (dataCheckout.status == "1"
                              ? "Diproses"
                              : "Selesai"),
                      style: dataCheckout.status == "0"
                          ? redTextStyle.copyWith(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            )
                          : dataCheckout.status == "1"
                              ? yellowTextStyle.copyWith(
                                  fontSize: 18, fontWeight: FontWeight.w500)
                              : greenTextStyle.copyWith(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
