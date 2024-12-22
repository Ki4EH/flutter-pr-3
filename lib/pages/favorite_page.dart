import 'package:flutter/material.dart';
import 'package:pr3/components/product_card.dart';
import 'package:pr3/models/product.dart';

class FavoritePage extends StatelessWidget {
  final List<Product> products;

  const FavoritePage({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Избранное'),
      ),
      backgroundColor: Colors.white,
      body: ListView.builder(
        shrinkWrap: true,
        physics: const AlwaysScrollableScrollPhysics(
        ),
        padding: const EdgeInsets.all(8.0),
        itemCount: products.length,
        itemBuilder: (BuildContext context, int index) {
          return ProductCard(
            product: products[index],
          );
        },
      ),
    );
  }
}