import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pr7/components/cart_item_card.dart';

import '../models/cart_item.dart';

class CartPage extends StatefulWidget {
  const CartPage({
    super.key,
    required this.items,
    required this.deleteItem,
    required this.decrementAmount,
    required this.incrementAmount,
  });

  final List<CartItem> items;
  final Function deleteItem;
  final Function decrementAmount;
  final Function incrementAmount;

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    int totalCost = widget.items
        .fold(0, (total, item) => total + item.patients * item.service.price);

    return Scaffold(
        body: Padding(
            padding: const EdgeInsets.only(top: 48.0, left: 27.0, right: 27.0),
            child: ListView(
                children: [
                  Text("Корзина",
                      textAlign: TextAlign.left,
                      style: GoogleFonts.montserrat(
                          textStyle: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w500,
                        height: 28 / 24,
                        letterSpacing: 24.0 * -0.0033,
                      ))),
                  const SizedBox(height: 30),
                  ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: widget.items.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: CartItemCard(
                                item: widget.items[index],
                                onDelete: () => widget.deleteItem(index),
                                onDecrement: () => widget.decrementAmount(index),
                                onIncrement: () => widget.incrementAmount(index)));
                      }),
                  const SizedBox(height: 32),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Сумма",
                          textAlign: TextAlign.left,
                          style: GoogleFonts.montserrat(
                              textStyle: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                                height: 28 / 20,
                                letterSpacing: 20.0 * 0.0038,
                              ))
                      ),
                      Text("$totalCost ₽",
                          textAlign: TextAlign.left,
                          style: GoogleFonts.montserrat(
                              textStyle: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                                height: 28 / 20,
                                letterSpacing: 20.0 * 0.0038,
                              ))
                      )
                    ]
                  ),
                  widget.items.isNotEmpty ? Padding(
                    padding: EdgeInsets.fromLTRB(
                        0,
                        widget.items.length > 3 ? 40 :
                        MediaQuery.of(context).size.height - 106 - (16 + 136) * widget.items.length - 68 - kBottomNavigationBarHeight - 40 - 60,
                        // widget.items.length == 1 ? 306 : widget.items.length == 2 ? 152 : 40,
                      0,
                      40
                    ),
                    child: ElevatedButton(
                        onPressed: (){},
                        style: ElevatedButton.styleFrom(
                            backgroundColor: const Color.fromRGBO(26, 111, 238, 1),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            padding: const EdgeInsets.symmetric(vertical: 16.0),
                            minimumSize: const Size(double.infinity, 56),
                        ),
                        child: Text("Перейти к оформлению заказа",
                            style: GoogleFonts.montserrat(
                                textStyle: const TextStyle(
                                  fontWeight: FontWeight.w500,
                                  height: 24 / 17,
                                  fontSize: 17,
                                  color: Colors.white,
                                )
                            )
                        )
                    ),
                  ) : Container()
                ])
        )
    );
  }
}
