import 'package:cafe/src/components/home/text.dart';
import 'package:cafe/src/controller/homeController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeOrder extends StatefulWidget {
  const HomeOrder({Key? key}) : super(key: key);

  @override
  _HomeOrderState createState() => _HomeOrderState();
}

class _HomeOrderState extends State<HomeOrder> {
  final TextEditingController _nicknameController = TextEditingController();
  final controller = Get.put(HomeController());
  bool _isButtonEnabled = false;

  @override
  void dispose() {
    _nicknameController.dispose();
    super.dispose();
  }

  void _updateButtonEnabled(String value) {
    setState(() {
      _isButtonEnabled = value.length > 1; // 한 글자 이상인 경우에만 활성화
    });
  }

  void addOrder() {}

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: () {
            showModalBottomSheet(
              context: context,
              builder: (BuildContext context) {
                return Container(
                  height: 300,
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '주문 받으실 닉네임을 설정해 주세요',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 16),
                      Text('닉네임'),
                      TextField(
                        controller: _nicknameController,
                        onChanged: (value) => _updateButtonEnabled(value),
                      ),
                      SizedBox(height: 8),
                      Text('닉네임은 한글로 설정해 주세요(1~5 자)'),
                      SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: _isButtonEnabled
                            ? () {
                                // 주문 요청 처리 로직 작성
                                // 예: 서버로 주문 요청 전송 등
                                // widget.addOrder();
                              }
                            : null,
                        child: Text('주문 요청'),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.pink,
                          textStyle: TextStyle(fontSize: 16),
                          padding: EdgeInsets.symmetric(
                            horizontal: 24,
                            vertical: 16,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          },
          child: Text('주문하기'),
          style: ElevatedButton.styleFrom(
            primary: Colors.pink,
            textStyle: TextStyle(fontSize: 16),
            padding: EdgeInsets.symmetric(horizontal: 24, vertical: 30),
          ),
        ),
      ],
    );
  }
}
