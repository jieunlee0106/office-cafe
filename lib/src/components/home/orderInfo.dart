import 'package:cafe/src/components/home/homeOrder.dart';
import 'package:cafe/src/components/home/homeOrdered.dart';
import 'package:cafe/src/components/home/homeSelected.dart';
import 'package:flutter/material.dart';

class OrderInfo extends StatelessWidget {
  const OrderInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        HomeSelected(),
        Column(
          children: [
            // HomeOrdered(), // 주문 현황
            HomeOrder(), // 주문 하기
          ],
        ),
      ],
    );
  }
}
