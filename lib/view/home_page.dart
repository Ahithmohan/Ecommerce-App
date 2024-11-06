import 'package:ecommerce/controller/product_controller.dart';
import 'package:flutter/material.dart';

import '../model/get_product_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ProductController _productController = ProductController();
  late Future<List<GetProductModel>> _productFuture;

  @override
  void initState() {
    // TODO: implement initState
    _productFuture = _productController.fetchData();
    super.initState();
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
              child: FutureBuilder(
            future: _productFuture,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: Text("Error: ${snapshot.error}"));
              } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return const Center(child: Text("No products found"));
              } else {
                final products = snapshot.data!;
                return GridView.builder(
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
                );
              }
            },
          )),
        ],
      ),
    );
  }
}
