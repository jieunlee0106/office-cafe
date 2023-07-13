// coffee.dart
import 'package:cafe/src/components/category/menucard.dart';
import 'package:flutter/material.dart';

class Coffee extends StatelessWidget {
  const Coffee({Key? key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      width: double.infinity,
      color: Colors.black45,
      child: ListView(
        children: [
          MenuCard(
            id: 1,
            name: '아메리카노',
            englishName: 'Americano',
            image: NetworkImage(
                'https://kfcapi.inicis.com/kfcs_api_img/KFCS/goods/DL_1444725_20220704182019850.png'),
          ),
          MenuCard(
            id: 2,
            name: '라떼',
            englishName: 'Latte',
            image: NetworkImage(
                'https://kfcapi.inicis.com/kfcs_api_img/KFCS/goods/DL_1444725_20220704182019850.png'),
          ),
          MenuCard(
            id: 3,
            name: '모카',
            englishName: 'Mocha',
            image: NetworkImage(
                'https://kfcapi.inicis.com/kfcs_api_img/KFCS/goods/DL_1444725_20220704182019850.png'),
          ),
          MenuCard(
            id: 1,
            name: '아메리카노',
            englishName: 'Americano',
            image: NetworkImage(
                'https://kfcapi.inicis.com/kfcs_api_img/KFCS/goods/DL_1444725_20220704182019850.png'),
          ),
          MenuCard(
            id: 2,
            name: '라떼',
            englishName: 'Latte',
            image: NetworkImage(
                'https://kfcapi.inicis.com/kfcs_api_img/KFCS/goods/DL_1444725_20220704182019850.png'),
          ),
          MenuCard(
            id: 3,
            name: '모카',
            englishName: 'Mocha',
            image: NetworkImage(
                'https://kfcapi.inicis.com/kfcs_api_img/KFCS/goods/DL_1444725_20220704182019850.png'),
          ),
        ],
      ),
    );
  }
}
