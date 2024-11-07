import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:ecommerce/model/get_product_model.dart';
import 'package:ecommerce/model/product_response_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ProductResponseModel productResponseModel = ProductResponseModel();
  List<ProductResponseModel> products = [];
  // getData() async {
  //   final response = await Dio().get("https://fakestoreapi.com/products");
  //   final responseBody = jsonDecode(response.data) as List;
  //
  //   final allProducts = responseBody['data']
  //       .map((e) => ProductResponseModel.fromJson(e))
  //       .toList();
  //
  //   print(response.data);
  //   productResponseModel = ProductResponseModel.fromJson(response.data);
  //   // for (var i = 0; i < response.data.length; i++) {
  //   //   productResponseModel = ProductResponseModel.fromJson(response.data[i]);
  //   //   print("${productResponseModel.id} ${productResponseModel.title}");
  //   //   // productResponseModel.products.toList();
  //   // }
  //   // print("-------------Length-------------");
  //   // print(products.length);
  // }

  @override
  void initState() {
    super.initState();
    // getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          const SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Ecommerce App",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                ),
                Image.asset("assets/images/25-trolly.png",
                    height: 24, width: 24),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              elevation: 5,
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(
                      0xffF8F8F8), // Background color for card style
                  borderRadius: BorderRadius.circular(12), // Rounded corners
                ),
                child: const TextField(
                  decoration: InputDecoration(
                    hintText: "Search items",
                    hintStyle: TextStyle(color: Colors.grey, fontSize: 14),
                    border: InputBorder.none, // No outline border
                    prefixIcon: Icon(Icons.search_rounded),
                    contentPadding: EdgeInsets.symmetric(vertical: 15.0),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(8.0),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 8.0,
                crossAxisSpacing: 8.0,
                childAspectRatio: 0.8,
              ),
              itemCount: products.length, // Number of items to display
              itemBuilder: (context, index) {
                return Card(
                  color: const Color(0xffF8F8F8),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 9,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.asset(
                              "assets/images/image 268.png",
                              fit: BoxFit.cover,
                              width: double.infinity,
                            ),
                          ),
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          "Leather Sofa",
                          style: TextStyle(fontWeight: FontWeight.w700),
                        ),
                        const SizedBox(height: 4),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "1500/-",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w900),
                            ),
                            Image.asset(
                              "assets/images/Group 53.png",
                              height: 24,
                              width: 24,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
