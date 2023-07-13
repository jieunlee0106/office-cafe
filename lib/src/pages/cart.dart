import 'package:cafe/src/controller/homeController.dart';
import 'package:cafe/src/model/pickModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Cart extends StatefulWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  late SelectedModel selectedModel;
  final controller = Get.put(HomeController());
  bool _isLoading = true;
  Future<void> getCartList() async {
    await controller.getCartList(deviceId: "지은은");
    selectedModel = controller.selectedModel;
    print(selectedModel.drinks);
  }

  Future<void> loadData() async {
    await controller.getCartList(deviceId: "지은은");
    selectedModel = controller.selectedModel;
    setState(() {
      _isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    loadData();
    getCartList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: ListView.builder(
        itemCount: selectedModel.drinks?.length ?? 0,
        itemBuilder: (context, index) {
          final drink = selectedModel.drinks![index];

          return Card(
            child: ListTile(
              title: Text(drink.item ?? ''),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Order Item Count: ${drink.orderItemCount ?? ''}'),
                  Text('Temp: ${drink.temp ?? ''}'),
                  Text('Shot Count: ${drink.shotCount ?? ''}'),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
