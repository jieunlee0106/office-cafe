import 'package:cafe/src/model/pickModel.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final dio = Dio();
  late SelectedModel selectedModel;

  // 메뉴조회 Controller

  getMenuCategory(int category) async {
    print('통신한다 controller');

    try {
      final response = await getMenuCategoryAPI(category: category);

      print(response);
    } catch (e) {
      print(e);
    }
  }

  // 메뉴 조회 service
  Future<dynamic> getMenuCategoryAPI({required int category}) async {
    print('통신한다 service');

    try {
      final response = await dio.get(
          'http://192.168.100.157:9090/api/v1/ilsung/cafe/order/item',
          queryParameters: {'category': 1});
      print(response);
      print('asdasdasd');
    } catch (e) {
      print(e);
    }
  }

  // 주문 요청 controller
  addOrder({required}) async {
    try {
      await dio.post(
        'http://192.168.100.157:9090/api/v1/ilsung/cafe/order/item',
        options: Options(
          headers: {'Content-Type': 'application/json'},
        ),
      );
    } catch (e) {}
  }

  // 사용자 카트 조회 controller
  getSportCategoryList(String deviceId) async {
    try {
      final response = await getCartList(deviceId: deviceId);
      print(response);
      selectedModel = SelectedModel.fromJson(response.data);
      print('값 할당');
    } catch (e) {
      print(e);
    }
  }

  // 사용자 카트 조회 service
  Future<dynamic> getCartList({required String deviceId}) async {
    print('통신 한다');
    try {
      final response = await dio.get(
        'http://192.168.100.157:9090/api/v1/ilsung/cafe/order/cart',
        queryParameters: {'deviceId': "지은은"},
      );
      print(response);
      return response.data;
    } catch (e) {
      print('!!!!!!!!!!!');
      print(e);
      throw Exception('Failed to fetch cart.');
    }
  }
}
