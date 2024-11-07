import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:ecommerce/model/product_response_model.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // List of products to store fetched data
  List<ProductResponseModel> products = [];
  // Boolean to track loading state
  bool isLoading = true;

  // Method to fetch data from the API
  getData() async {
    try {
      final response = await Dio().get("https://fakestoreapi.com/products");
      List<dynamic> data = response.data;
      setState(() {
        products = data
            .map((productJson) => ProductResponseModel.fromJson(productJson))
            .toList();
        isLoading = false; // Data is fetched, stop loading
      });
    } catch (e) {
      print("Failed to fetch products: $e");
      setState(() {
        isLoading = false; // Stop loading on error
      });
    }
  }

  @override
  void initState() {
    super.initState();
    getData(); // Fetch data when the page is loaded
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
                  color: const Color(0xffF8F8F8),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const TextField(
                  decoration: InputDecoration(
                    hintText: "Search items",
                    hintStyle: TextStyle(color: Colors.grey, fontSize: 14),
                    border: InputBorder.none,
                    prefixIcon: Icon(Icons.search_rounded),
                    contentPadding: EdgeInsets.symmetric(vertical: 15.0),
                  ),
                ),
              ),
            ),
          ),
          // Show a loading indicator if data is still loading
          isLoading
              ? const Center(child: CircularProgressIndicator())
              : Expanded(
                  child: GridView.builder(
                    padding: const EdgeInsets.all(8.0),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 8.0,
                      crossAxisSpacing: 8.0,
                      childAspectRatio: 0.8,
                    ),
                    itemCount: products.length, // Use the fetched data length
                    itemBuilder: (context, index) {
                      final product = products[index];
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
                                  child: Image.network(
                                    product.image ?? "d", // Use product's image
                                    fit: BoxFit.cover,
                                    width: double.infinity,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                product.title.toString(),
                                style: const TextStyle(
                                    fontWeight: FontWeight.w700),
                              ),
                              const SizedBox(height: 4),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "${product.price}/-",
                                    style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w900),
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
