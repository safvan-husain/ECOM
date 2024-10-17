import 'package:e_com/screens/product_screen.dart';
import 'package:e_com/screens/widgets/product_tile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Image.asset("assets/images/logo.png"),
        ),
        actions: const [
          Icon(Icons.search),
          Icon(Icons.favorite),
          Icon(Icons.shop),
        ]
            .map((e) => Padding(
                  padding: const EdgeInsets.all(5),
                  child: e,
                ))
            .toList(),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
              ),
              label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.portable_wifi_off_outlined,
              ),
              label: "Best"),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.portable_wifi_off_outlined,
              ),
              label: "Best"),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
              ),
              label: "profile"),
        ],
      ),
      body: SafeArea(
          child: Column(
        children: [
          SizedBox(
            width: double.infinity,
            height: 200,
            child: Stack(
              children: [
                Positioned(
                  top: 0,
                  right: 0,
                  left: 0,
                  bottom: 0,
                  child: Image.asset(
                    "assets/images/clothe.webp",
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 10,
                  right: 10,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.white),
                    ),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: const Text(
                      "Shope Now",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 11,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          _buildSectionTitle(
            title: "Our Brands",
            onViewAll: () => Get.to(const ProductList()),
          ),
          SizedBox(
            width: Get.size.width,
            height: 150,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 5,
              itemBuilder: (context, index) {
                return const ProductTile(width: 100, height: 150);
              },
            ),
          ),
          _buildSectionTitle(
            title: "Suggested for you",
            onViewAll: () => Get.to(const ProductList()),
          ),
          SizedBox(
            width: Get.size.width,
            height: 250,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 5,
              itemBuilder: (context, index) {
                return const ProductTile(width: 150, height: 250);
              },
            ),
          )
        ],
      )),
    );
  }

  Padding _buildSectionTitle({
    required String title,
    required void Function() onViewAll,
  }) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          GestureDetector(
            onTap: onViewAll,
            child: const Text(
              "View all",
              style: TextStyle(
                decoration: TextDecoration.underline,
                fontSize: 12,
                color: Colors.grey,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
