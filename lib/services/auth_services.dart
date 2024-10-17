import 'dart:convert';

import 'package:e_com/product_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ApiServices {
  static Future<String?> login({
    required String email,
    required String password,
  }) async {
    var uri = Uri.parse(
      "https://swan.alisonsnewdemo.online/api/login?email_phone=$email&&password=$password",
    );
    var response = await http.post(
      uri,
    );
    if (response.statusCode == 200) {
      print(response.body);
      try {
        String? token = jsonDecode(response.body)["customerdata"]["token"];
        return token;
      } catch (e) {
        Get.showSnackbar(GetSnackBar(
          title: "Error",
          message: jsonDecode(response.body)["message"],
        ));
      }
    }
    return null;
  }

  static Future<List<ProductModel>> getProducts(String token) async {
    var uri = Uri.parse(
        "https://swan.alisonsnewdemo.online/api/products/en?id=bDy&token=$token&page=1");
    var response = await http.post(
      uri,
    );
    List<ProductModel> products = [];
    if (response.statusCode == 200) {
      List<dynamic> jsonProducts =
          jsonDecode(response.body)["products"]["return"]['data'];
      for (var productJson in jsonProducts) {
        products.add(ProductModel.fromMap(productJson));
      }
    }
    return products;
  }
}
