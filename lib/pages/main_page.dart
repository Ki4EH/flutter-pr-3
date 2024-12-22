import 'package:flutter/material.dart';
import 'package:pr3/components/product_card.dart';
import 'package:pr3/models/product.dart';
import 'package:pr3/pages/favorite_page.dart';
import 'package:pr3/pages/profile_pages.dart';

import '../mocks/products.dart';
import '../models/user.dart';

import 'add_product_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final User user = User(
    avatarUrl: 'https://sun9-64.userapi.com/impg/tg8c3xWlTr_nnZOXWD7zGJBwq64CPP-N2tuTlQ/A88lcCiStPI.jpg?size=1620x2160&quality=95&sign=ad3b1971ec502574abdc6ea0f8b1ef2b&type=album',
    email: 'tytemail@email.ru',
    fullName: 'Аксенов Кирилл Викторович',
    phoneNumber: '8 (999)-999-99-99',
  );



  int _currentIndex = 0;

  List<Product> get favoriteProducts => products.where((product) => product.isFavorite).toList();

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

        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AddProductPage(onItemAdded: (newItem) {
                  setState(() {
                    newItem.id = products.length + 1;
                    products.add(newItem);
                  });
                }),
              ),
            );
          },
          child: const Icon(Icons.add),
    ),
    bottomNavigationBar: BottomNavigationBar(
    currentIndex: _currentIndex,
    onTap: (index) {
    setState(() {
    _currentIndex = index;
    });
    if (index == 1) {
    Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => FavoritePage(products: favoriteProducts)),
    );
    } else if (index == 2) {
    Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => ProfilePage(user: user)),
    );
    }
    },
    items: const [
    BottomNavigationBarItem(
    icon: Icon(Icons.list),
    label: 'Товары',
    ),
    BottomNavigationBarItem(
    icon: Icon(Icons.favorite),
    label: 'Избранное',
    ),
    BottomNavigationBarItem(
    icon: Icon(Icons.person),
    label: 'Профиль',
    ),
    ],
          backgroundColor: Colors.grey,
        )
    );
  }
}

