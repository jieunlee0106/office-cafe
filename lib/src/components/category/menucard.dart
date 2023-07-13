import 'package:cafe/src/pages/menuDetail.dart';
import 'package:cafe/src/pages/menuDetialTest.dart';
import 'package:flutter/material.dart';

class MenuCard extends StatelessWidget {
  final String name;
  final String englishName;
  final NetworkImage image;
  final int id;

  const MenuCard({
    required this.name,
    required this.englishName,
    required this.image,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => MenuDetailT(),
            ),
          );
        },
        child: Row(
          children: [
            Image(
              image: image,
              width: 80, // 이미지의 가로 크기 조절
              height: 80, // 이미지의 세로 크기 조절
            ),
            SizedBox(width: 16), // 이미지와 글자 사이 간격 조정
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name),
                Text(englishName),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
