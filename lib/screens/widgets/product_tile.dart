import 'package:flutter/material.dart';

class ProductTile extends StatelessWidget {
  final double width;
  final double height;
  final bool isNew;
  final bool isOffer;
  final String name;
  final String price;
  const ProductTile(
      {super.key,
      required this.width,
      required this.height,
      this.isNew = false,
      this.isOffer = false,
      this.name = "Test product",
      this.price = "00"});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      margin: const EdgeInsets.all(10),
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Stack(
                  children: [
                    Positioned(
                      top: 0,
                      bottom: 0,
                      right: 0,
                      left: 0,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          "assets/images/clothe.webp",
                          //image does not have complete url from api (no prefix provided), so using asset.
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    if (isNew || isOffer)
                      Positioned(
                        bottom: 20,
                        left: 10,
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          color: isNew
                              ? Colors.black26
                              : Colors.greenAccent.shade200,
                          child: Text(
                            isNew ? "New arrival" : "50% OFF",
                            style: const TextStyle(color: Colors.white),
                          ),
                        ),
                      )
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                name,
                maxLines: 1,
                style: const TextStyle(fontSize: 10),
              ),
              Text("\$$price")
            ],
          ),
        ],
      ),
    );
  }
}
