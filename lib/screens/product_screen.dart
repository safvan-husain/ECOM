import 'package:e_com/cubit/application_cubit.dart';
import 'package:e_com/screens/widgets/product_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

class ProductList extends StatefulWidget {
  const ProductList({super.key});

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  @override
  void initState() {
    context.read<ApplicationCubit>().getPoducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () => Get.back(),
          child: const Icon(Icons.arrow_back_ios),
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
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: BlocBuilder<ApplicationCubit, ApplicationState>(
                  builder: (context, state) {
                    if (state.products.isEmpty) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    return GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: .7,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                      ),
                      itemCount: state.products.length,
                      itemBuilder: (context, index) {
                        var product = state.products.elementAt(index);
                        return ProductTile(
                          width: 100,
                          height: 100,
                          isOffer: true,
                          name: product.name,
                          price: product.price,
                        );
                      },
                    );
                  },
                ),
              ),
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CircleAvatar(
                      radius: 5,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Sort"),
                        Text(
                          "New",
                          style: TextStyle(fontSize: 11),
                        ),
                      ],
                    )
                  ],
                ),
                VerticalDivider(
                  color: Colors.grey,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CircleAvatar(
                      radius: 5,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Filter"),
                        Text(
                          "None",
                          style: TextStyle(fontSize: 11),
                        ),
                      ],
                    )
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
