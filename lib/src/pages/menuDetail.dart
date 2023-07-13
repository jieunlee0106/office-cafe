import 'package:cafe/src/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class MenuDetail extends StatefulWidget {
  const MenuDetail({Key? key}) : super(key: key);

  @override
  _MenuDetailState createState() => _MenuDetailState();
}

class _MenuDetailState extends State<MenuDetail> {
  bool isHot = false; // hot/iced 선택 상태
  int shotCount = 0; // 샷 추가 개수

  List<Map<String, dynamic>> drinks = []; // 음료 리스트
  // final SelectedModel selectedModel = SelectedModel();

  Future<void> _saveOrder() async {
    final orderData = {
      'item': 1, // 음료 ID를 적절히 설정
      'orderItemCount': 1, // 주문 개수
      'isHot': isHot, // hot/iced 여부
      'shotCount': shotCount, // 샷 추가 개수
    };

    setState(() {
      drinks.add(orderData); // 음료 정보를 리스트에 추가
    });

    // final st = Drinks.fromJson(orderData);
    // selectedModel.drinks?.add(st);
    // selectedModel.drinks?.forEach((drinks) {
    //   print('Item: ${drinks.item}');
    //   print('Order Item Count: ${drinks.orderItemCount}');
    //   print('Temperature: ${drinks.isHot}');
    //   print('Shot Count: ${drinks.shotCount}');
    //   print('-----------------------');
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1.0,
        leading: IconButton(
          color: Colors.black54,
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text(
          '옵션 선택',
          style: TextStyle(
            color: Colors.black87,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(
            'https://kfcapi.inicis.com/kfcs_api_img/KFCS/goods/DL_1444725_20220704182019850.png',
            width: double.infinity,
            height: 250,
            fit: BoxFit.fill,
          ),
          SizedBox(height: 16),
          Text(
            '커피 이름',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            'coffee en name',
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey,
            ),
          ),
          SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      isHot = true;
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    primary: isHot ? Colors.pink : Colors.grey,
                  ),
                  child: Text('Hot'),
                ),
              ),
              SizedBox(width: 16),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      isHot = false;
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    primary: !isHot ? Colors.pink : Colors.grey,
                  ),
                  child: Text('Iced'),
                ),
              ),
            ],
          ),
          SizedBox(height: 16),
          Row(
            children: [
              IconButton(
                icon: Icon(Icons.remove),
                onPressed: () {
                  setState(() {
                    if (shotCount > 0) {
                      shotCount--;
                    }
                  });
                },
              ),
              Text('샷 추가: $shotCount'),
              IconButton(
                icon: Icon(Icons.add),
                onPressed: () {
                  setState(() {
                    shotCount++;
                  });
                },
              ),
            ],
          ),
          SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              _saveOrder(); // 주문 정보 저장
            },
            child: Text('주문 선택'),
          ),
        ],
      ),
    );
  }
}
