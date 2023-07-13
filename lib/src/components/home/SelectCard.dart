import 'package:flutter/material.dart';

class SelectCard extends StatelessWidget {
  final int? Ditem;

  const SelectCard({
    Key? key,
    required this.Ditem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          Ditem.toString(),
        ),
      ],
    );
  }
}
