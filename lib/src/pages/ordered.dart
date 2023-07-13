import 'package:flutter/material.dart';

class Ordered extends StatelessWidget {
  const Ordered({Key? key});

  @override
  Widget build(BuildContext context) {
    List<String> preparingOrders = ['001', '002', '003'];
    List<String> completedOrders = ['101', '102', '103'];
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
          '주문 현황',
          style: TextStyle(
            color: Colors.black87,
          ),
        ),
      ),
      body: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '준비 중',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 16),
                Expanded(
                  child: ListView.builder(
                    itemCount: preparingOrders.length,
                    itemBuilder: (context, index) {
                      final orderNumber = preparingOrders[index];
                      return Text('주문 번호: $orderNumber');
                    },
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '준비 완료',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 16),
                Expanded(
                  child: ListView.builder(
                    itemCount: completedOrders.length,
                    itemBuilder: (context, index) {
                      final orderNumber = completedOrders[index];
                      return Text('주문 번호: $orderNumber');
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
