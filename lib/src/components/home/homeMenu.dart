import 'package:cafe/src/components/category/coffee.dart';
import 'package:cafe/src/components/category/grayLine.dart';
import 'package:cafe/src/controller/homeController.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomeMenu extends StatefulWidget {
  const HomeMenu({super.key});

  @override
  _HomeMenuState createState() => _HomeMenuState();
}

class _HomeMenuState extends State<HomeMenu> {
  String selectedMenu = '커피'; // 선택된 메뉴 항목
  final controller = Get.put(HomeController());

  Future<void> getList() async {
    await controller.getMenuCategory(1);
  }

  @override
  Widget build(BuildContext context) {
    List<String> menuItems = ['커피', '논커피', '음료', '기타'];

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(1.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: menuItems.map((item) {
                bool isSelected = selectedMenu == item;
                return InkWell(
                  onTap: () {
                    // 메뉴 클릭 시 선택된 메뉴 항목 변경
                    setState(() {
                      selectedMenu = item;
                    });
                  },
                  child: AnimatedContainer(
                    duration: Duration(milliseconds: 200),
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      // color: isSelected ? Colors.pink : Colors.transparent,
                    ),
                    child: Column(
                      children: [
                        Text(
                          item,
                          style: TextStyle(
                            fontSize: 16,
                            color: isSelected ? Colors.pink : Colors.black45,
                          ),
                        ),
                        SizedBox(height: 2), // 선과 글자 사이 간격 조정
                        Container(
                          height: 2,
                          width: 40,
                          color: isSelected ? Colors.pink : Colors.transparent,
                        ),
                      ],
                    ),
                  ),
                );
              }).toList(),
            ),
            if (selectedMenu == '커피')
              Coffee()
            else if (selectedMenu == '논커피')
              Container(
                height: 500,
                width: double.infinity,
                color: Colors.amber,
              )
            else if (selectedMenu == '음료')
              Container(
                height: 500,
                width: double.infinity,
                color: Colors.blueAccent,
              )
            else
              Container(
                height: 500,
                width: double.infinity,
                color: Colors.green,
              ),
          ],
        ),
      ),
    );
  }
}
