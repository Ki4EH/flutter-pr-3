import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pr7/pages/cart_page.dart';
import 'package:pr7/pages/main_page.dart';
import 'package:pr7/pages/profile_page.dart';
import '../data.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../models/service.dart';
import 'models/cart_item.dart';
import 'models/profile.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'pr7',
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});


  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedPage = 0;

  final List<Service> _services = services;
  final Profile _profile = profile;
  final List<CartItem> _cart = cart;

  List<Widget> get _pageOptions => <Widget>[
      MainPage(
        services: _services,
        addToCart: _addToCart,
      ),
     CartPage(
       items: _cart,
       deleteItem: _removeFromCart,
       decrementAmount: _decrementAmount,
       incrementAmount: _incrementAmount,
     ),
    ProfilePage(
      profile: _profile,
    )
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedPage = index;
    });
  }

  void _removeFromCart(int index){
    setState(() {
      _cart.removeAt(index);
    });
  }

  void _decrementAmount(int index){
    if (_cart[index].patients <= 1){
      _removeFromCart(index);
    } else {
      setState(() {
        _cart[index].patients -= 1;
      });
    }
  }

  void _incrementAmount(int index){
    setState(() {
      _cart[index].patients += 1;
    });
  }

  void _addToCart(Service service){
    int index = _cart.indexWhere((el) => el.service.name == service.name);
    if (index == -1){
      setState(() {
        _cart.add(CartItem(
          service,
          1
        ));
      });
    } else {
      setState((){
        _cart[index].patients += 1;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
      return Scaffold(
      body: _pageOptions.elementAt(_selectedPage),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  'assets/images/Home.svg',
                  colorFilter: _selectedPage == 0
                      ? const ColorFilter.mode(Color.fromRGBO(26, 111, 238, 1.0), BlendMode.srcIn)
                      : const ColorFilter.mode(Color.fromRGBO(137, 138, 141, 1.0), BlendMode.srcIn),
                ),
                label: "Главная"
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/images/Cart.svg',
                colorFilter: _selectedPage == 1
                    ? const ColorFilter.mode(Color.fromRGBO(26, 111, 238, 1.0), BlendMode.srcIn)
                    : const ColorFilter.mode(Color.fromRGBO(137, 138, 141, 1.0), BlendMode.srcIn),
              ),
              label: 'Корзина',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/images/Person.svg',
                colorFilter: _selectedPage == 2
                    ? const ColorFilter.mode(Color.fromRGBO(26, 111, 238, 1.0), BlendMode.srcIn)
                    : const ColorFilter.mode(Color.fromRGBO(137, 138, 141, 1.0), BlendMode.srcIn),
              ),
              label: 'Профиль',
            ),
          ],
          currentIndex: _selectedPage,
          selectedItemColor: const Color.fromRGBO(26, 111, 238, 1.0),
          unselectedItemColor: const Color.fromRGBO(137, 138, 141, 1.0),
          selectedLabelStyle: GoogleFonts.montserrat(
              textStyle: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w300,
                height: 16 / 12
              )
          ),
          unselectedLabelStyle: GoogleFonts.montserrat(
              textStyle: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w300,
                height: 16 / 12
              )
          ),
          onTap: _onItemTapped,
        ),
    );
  }
}
