import 'package:cafe/src/components/home/homeMenu.dart';
import 'package:cafe/src/components/home/orderInfo.dart';
import 'package:cafe/src/controller/homeController.dart';
import 'package:cafe/src/components/home/text.dart';
import 'package:device_info/device_info.dart';
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
  late String deviceInfo; // 기기 정보 변수

  Future<void> getDeviceInfo() async {
    final DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
    try {
      if (Theme.of(context).platform == TargetPlatform.android) {
        final AndroidDeviceInfo androidInfo =
            await deviceInfoPlugin.androidInfo;
        deviceInfo = 'Android ${androidInfo.model}';
      } else if (Theme.of(context).platform == TargetPlatform.iOS) {
        final IosDeviceInfo iosInfo = await deviceInfoPlugin.iosInfo;
        deviceInfo = 'iOS ${iosInfo.model}';
      }
    } catch (e) {
      deviceInfo = 'Unknown';
    }
    // Device Info를 SharedPreferences에 저장
    final preferences = await SharedPreferences.getInstance();
    await preferences.setString('deviceInfo', deviceInfo);
    print(deviceInfo);
  }

  Future<void> getList() async {
    await controller.getMenuCategory(1);
  }

  @override
  void initState() {
    super.initState();
    getDeviceInfo();
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


/////////////////////////////////////////
///
///import 'package:cafe/src/components/home/homeMenu.dart';
// import 'package:cafe/src/components/home/orderInfo.dart';
// import 'package:cafe/src/controller/homeController.dart';
// import 'package:cafe/src/components/home/text.dart';
// import 'package:flutter/gestures.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class Home extends StatefulWidget {
//   const Home({super.key});

//   // const Home({Key? key}) : super(key: key);

//   @override
//   _HomeState createState() => _HomeState();
// }

// class _HomeState extends State<Home> {
//   final controller = Get.put(HomeController());
//   String selectedMenu = '커피'; // 선택된 메뉴 항목

//   Future<void> getList() async {
//     await controller.getMenuCategory(1);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           backgroundColor: Colors.white,
//           elevation: 1.0,
//           leading: IconButton(
//             color: Colors.black54,
//             icon: Icon(Icons.arrow_back),
//             onPressed: () {
//               Navigator.of(context).pop();
//             },
//           ),
//           title: Text(
//             '메뉴 정보',
//             style: TextStyle(
//               color: Colors.black87,
//             ),
//           ),
//         ),
//         body: Column(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Expanded(
//               child: HomeMenu(),
//             ),
//             Container(
//               height: MediaQuery.of(context).size.height / 5, // 화면 높이의 1/5 부분
//               child: OrderInfo(),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
