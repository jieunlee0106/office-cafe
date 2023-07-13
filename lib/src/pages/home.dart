import 'package:cafe/src/components/home/homeMenu.dart';
import 'package:cafe/src/components/home/orderInfo.dart';
import 'package:cafe/src/config/deviceId.dart';
import 'package:cafe/src/controller/homeController.dart';
import 'package:cafe/src/components/home/text.dart';
import 'package:cafe/src/model/pickModel.dart';
import 'package:cafe/src/pages/cart.dart';
import 'package:device_info/device_info.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final controller = Get.put(HomeController());
  String selectedMenu = '커피'; // 선택된 메뉴 항목
  String deviceInfo = ''; // 기기 정보 변수

  Future<String> getDeviceId() async {
    final DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
    String deviceId = '';

    try {
      if (Theme.of(context).platform == TargetPlatform.android) {
        final AndroidDeviceInfo androidInfo =
            await deviceInfoPlugin.androidInfo;
        deviceId = androidInfo.androidId;
      } else if (Theme.of(context).platform == TargetPlatform.iOS) {
        final IosDeviceInfo iosInfo = await deviceInfoPlugin.iosInfo;
        deviceId = iosInfo.identifierForVendor;
      }
    } catch (e) {
      print('Failed to get device ID: $e');
    }
    print('${deviceId}');
    return deviceId;
  }

  Future<void> getList() async {
    await controller.getMenuCategory(1);
  }

  @override
  void initState() {
    super.initState();
    getCart();
    // getDeviceInfo();
  }

  Future<void> getCart() async {
    await controller.getCartList(deviceId: "지은은");
    // controller.getMenuCategory(1);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    getDeviceId().then((deviceId) {
      DeviceId.saveDeviceId(deviceId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
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
            '메뉴 정보',
            style: TextStyle(
              color: Colors.black87,
            ),
          ),
          actions: [
            IconButton(
              color: Colors.black54,
              icon: Icon(Icons.shopping_cart),
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => Cart()));
              },
            ),
          ],
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: HomeMenu(),
            ),
            Container(
              height: MediaQuery.of(context).size.height / 5, // 화면 높이의 1/5 부분
              child: Column(
                children: [
                  Text('기기 정보: $deviceInfo'),
                  OrderInfo(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
