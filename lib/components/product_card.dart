import 'package:flutter/material.dart';
import 'package:pr3/pages/product_page.dart';

import '../models/product.dart';


class ProductCard extends StatefulWidget {
  final Product product;

  final Function() onProductRemove;

  const ProductCard({super.key, required this.product, required this.onProductRemove});


  @override
  _ProductCardState createState() => _ProductCardState();
}


class _ProductCardState extends State<ProductCard> {
  void toggleFavorite() {
    setState(() {
      widget.product.isFavorite = !widget.product.isFavorite;
    });
  }

  void toggleCart(){
    setState(() {
      widget.product.isInCart = !widget.product.isInCart;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.all(16),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ProductPage(product: widget.product,
                  onProductRemove:  widget.onProductRemove),
            ),
          );
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.network(
                widget.product.imageUrl,
                height: 300,
                width: double.infinity,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      widget.product.title,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                  ),
                  IconButton(
                    icon: Icon(
                      widget.product.isFavorite ? Icons.favorite : Icons.favorite_border,
                      color: widget.product.isFavorite ? Colors.red : Colors.grey,
                    ),
                    onPressed: toggleFavorite,
                  ),
                ],
              ),
                  Text(
                    widget.product.category,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 8),
              Row(
                children: [
                  Text(
                    '${widget.product.price}₽',
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  IconButton(
                    icon: Icon(
                      widget.product.isFavorite ? Icons.favorite : Icons.favorite_border,
                      color: widget.product.isFavorite ? Colors.red : Colors.grey,
                    ),
                    onPressed: toggleFavorite,
                  ),
                  IconButton(
                    icon: Icon(
                      widget.product.isInCart ? Icons.shopping_cart : Icons.shopping_cart_outlined,
                    ),
                    onPressed: toggleCart,
                  ),
                ],),
                  const SizedBox(height: 4),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
