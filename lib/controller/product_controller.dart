import 'dart:convert';

import 'package:ecommerce/model/get_product_model.dart';
import 'package:http/http.dart' as http;

class ProductController {
  Future<List<GetProductModel>> fetchData() async {
    final response =
        await http.get(Uri.parse("https://api.escuelajs.co/api/v1/products"));

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      return data.map((json) => GetProductModel.fromJson(json)).toList();
    } else {
      throw Exception("Failed to load users");
    }
  }
}
