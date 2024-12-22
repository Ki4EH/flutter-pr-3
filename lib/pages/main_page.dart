import 'package:flutter/material.dart';
import 'package:pr3/components/product_card.dart';
import 'package:pr3/models/product.dart';


class MyHomePage extends StatelessWidget {
  MyHomePage({super.key});

  final List<Product> products = [
    Product(1, '1000 ГБ, с дисководом, Bluetooth 5.1, Wi-Fi 6 (802.11ax), HDMI 2.1, до 8K UltraHD, 7680x4320x', 5, 'Игровая Консоль', 'Игровая консоль PlayStation 5 Slim',67999,'https://c.dns-shop.ru/thumb/st4/fit/500/500/1e42cea75917ec29fb644691db846be6/429dffed72e676f83a402909877cf023018d6b593893afdcadc7bf965f1b7ca0.jpg.webp'),
    Product(2, '1000 ГБ, с дисководом, Wi-Fi 5 (802.11ac), HDMI 2.1, до 4K UltraHD, 3840x2160', 1, 'Игровая Консоль', 'Игровая консоль Microsoft Xbox Series X',64999,'https://c.dns-shop.ru/thumb/st4/fit/500/500/b4562592dd38dc2a80405bd2fd3f8374/92f5cbbe76cbccb59e28290a71366bae0581ff7ea0ece9b90426275db520108a.jpg.webp'),
    Product(3, '32 ГБ, экран 6.2", IPS, 1280x720, Bluetooth 4.1, Wi-Fi 5 (802.11ac)', 52, 'Игровая Консоль', 'Игровая консоль Nintendo Switch красный, синий',31999,'https://c.dns-shop.ru/thumb/st4/fit/500/500/aa4e05ff7e95a6234ec4bce4460ca2d9/21fef0dd1f93a3e7deca21ba0c350c748d719d09b84ef593cf241ae813b97439.jpg.webp'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Все товары'),),
        backgroundColor: Colors.white,
        body: ListView.builder(
            itemCount: products.length,
            itemBuilder: (BuildContext context, int index){
              return ProductCard(product: products[index]);
            }

        )
    );
  }
}

