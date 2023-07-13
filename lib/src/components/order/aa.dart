import 'package:cafe/src/components/order/nickName.dart';
import 'package:flutter/material.dart';

class MenuDetail extends StatefulWidget {
  const MenuDetail({Key? key}) : super(key: key);

  @override
  _MenuDetailState createState() => _MenuDetailState();
}

class _MenuDetailState extends State<MenuDetail> {
  bool isHot = true; // hot/iced 선택 상태
  int shotCount = 0; // 샷 추가 개수

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
            '커피 영어 이름',
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
                      isHot = false;
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    primary: !isHot ? Colors.pink : Colors.grey,
                  ),
                  child: Text('Hot'),
                ),
              ),
              SizedBox(width: 16),
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
                  child: Text('Iced'),
                ),
              ),
            ],
          ),
          SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (BuildContext context) {
                  return NickName();
                },
              );
            },
            child: Text('주문 선택'),
          ),
        ],
      ),
    );
  }
}
