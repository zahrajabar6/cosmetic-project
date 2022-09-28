import 'package:cosmetic_project/controllers/colors.dart';
import 'package:flutter/material.dart';

class OrderPrices extends StatelessWidget {
  const OrderPrices({
    Key? key, required this.subTotal, required this.total, required this.discount,
  }) : super(key: key);

  final String subTotal;
  final String total;
  final String discount;


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: Row(children: [
            Expanded(
              child: Text(
                'Sub Total',
                style: TextStyle(
                  fontSize: 20,
                  color: grey.withOpacity(0.50),
                ),
              ),
            ),
            Text(
              subTotal,
              style: TextStyle(
                fontSize: 20,
                color: grey.withOpacity(0.50),
              ),
            ),
          ]),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: Row(children: [
            Expanded(
              child: Text(
                'Discount',
                style: TextStyle(
                  fontSize: 20,
                  color: grey.withOpacity(0.50),
                ),
              ),
            ),
            Text(
              discount,
              style: TextStyle(
                fontSize: 20,
                color: grey.withOpacity(0.50),
              ),
            ),
          ]),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: Row(children: [
            Expanded(
              child: Text(
                'Delivery charge',
                style: TextStyle(
                  fontSize: 20,
                  color: grey.withOpacity(0.50),
                ),
              ),
            ),
            Text(
              r'$10.00',
              style: TextStyle(
                fontSize: 20,
                color: grey.withOpacity(0.50),
              ),
            ),
          ]),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 15),
          child: Row(children: [
            Expanded(
              child: Text(
                'Total Amount',
                style: TextStyle(
                  fontSize: 22,
                  color: grey,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Text(
              total,
              style: TextStyle(
                  fontSize: 22,
                  color: green,
                  fontWeight: FontWeight.bold),
            ),
          ]),
        ),
      ],
    );
  }
}
