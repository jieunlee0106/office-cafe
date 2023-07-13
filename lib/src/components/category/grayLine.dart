import 'package:flutter/material.dart';

class GrayLine extends StatelessWidget {
  const GrayLine({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1,
      width: 360,
      decoration: BoxDecoration(color: Colors.black45),
    );
  }
}
