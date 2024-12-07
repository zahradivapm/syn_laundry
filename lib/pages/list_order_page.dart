import 'package:flutter/material.dart';
import 'package:syn_laundry/models/Checkout_model.dart';
import 'package:syn_laundry/services/checkout_services.dart';
import 'package:syn_laundry/themes/themes.dart';
import 'package:syn_laundry/widgets/order_widget.dart';
import 'package:sp_util/sp_util.dart';

class ListOrderPage extends StatelessWidget {
  const ListOrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Pemesanan",
          style: primaryTextStyle.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          // BARIS 1
          Container(
            margin: EdgeInsets.only(top: 40, left: 20),
            child: Text(
              "Pesanan Baru",
              style: primaryTextStyle.copyWith(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),

          FutureBuilder<List<Checkoutmodel>>(
              future: CheckoutServices()
                  .listCheckoutBaru(SpUtil.getInt("id_user").toString()),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(
                      color: primaryColor,
                    ),
                  );
                } else if (snapshot.hasData) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ...snapshot.data!.map((dataCheckout) {
                        return OrderWidget(
                          dataCheckout: dataCheckout,
                        );
                      })
                    ],
                  );
                }
                return Container();
              }),

          Container(
            margin: EdgeInsets.only(top: 40, left: 20),
            child: Text(
              "Pesanan Diproses",
              style: primaryTextStyle.copyWith(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          FutureBuilder<List<Checkoutmodel>>(
              future: CheckoutServices()
                  .listCheckoutProses(SpUtil.getInt("id_user").toString()),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(
                      color: primaryColor,
                    ),
                  );
                } else if (snapshot.hasData) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ...snapshot.data!.map((dataCheckout) {
                        return OrderWidget(
                          dataCheckout: dataCheckout,
                        );
                      })
                    ],
                  );
                }
                return Container();
              }),

          // BARIS 3
          Container(
            margin: EdgeInsets.only(top: 41, left: 20),
            child: Text(
              "Riwayat Pemesanan",
              style: primaryTextStyle.copyWith(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          FutureBuilder<List<Checkoutmodel>>(
              future: CheckoutServices()
                  .listCheckoutSelesai(SpUtil.getInt("id_user").toString()),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(
                      color: primaryColor,
                    ),
                  );
                } else if (snapshot.hasData) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ...snapshot.data!.map((dataCheckout) {
                        return OrderWidget(
                          dataCheckout: dataCheckout,
                        );
                      })
                    ],
                  );
                }
                return Container();
              }),

          // BARIS 4
          // OrderWidget(
          //   layanan: "Laundry + Setrika",
          //   paket: "Express",
          //   tanggal: "24/08/2024",
          //   status: "Selesai",
          // ),

          // BARIS 5
        ],
      ),
    );
  }
}
