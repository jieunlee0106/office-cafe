import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class HomeSelected extends StatefulWidget {
  const HomeSelected({Key? key}) : super(key: key);

  @override
  _HomeSelectedState createState() => _HomeSelectedState();
}

class _HomeSelectedState extends State<HomeSelected> {
  final storage = FlutterSecureStorage();
  String? deviceId;

  @override
  void initState() {
    super.initState();
    getDeviceId();
  }

  Future<void> getDeviceId() async {
    final storedDeviceId = await storage.read(key: 'deviceId');
    setState(() {
      deviceId = storedDeviceId;
      print(deviceId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.red,
      ),
      child: Column(
        children: [
          Container(
            width: 100,
            height: 40,
            child: Text('선택 상품'),
          ),
          if (deviceId != null)
            Text(
              'Device ID: $deviceId',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
        ],
      ),
    );
  }
}
