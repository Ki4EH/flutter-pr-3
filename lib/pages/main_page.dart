import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../components/service_card.dart';
import '../models/service.dart';

class MainPage extends StatelessWidget {
  const MainPage({
    super.key,
    required this.services,
    required this.addToCart
  });

  final List<Service> services;
  final Function addToCart;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(
            top: 48.0,
            left: 27.0,
            right: 27.0
        ),
        child: ListView(
          children: [
            Text("Каталог услуг",
                textAlign: TextAlign.left,
                style: GoogleFonts.montserrat(
                    textStyle: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w500,
                      height: 28 / 24,
                      letterSpacing: 24.0 * -0.0033,
                    )
                )
            ),
            const SizedBox(height: 30),
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: services.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 8.0
                  ),
                  child: ServiceCard(
                      service: services[index],
                      onAdd: () => addToCart(services[index])
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
