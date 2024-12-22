import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pr7/components/incrementor.dart';
import 'package:pr7/utils.dart';
import '../models/cart_item.dart';

class CartItemCard extends StatelessWidget {
  const CartItemCard({
    super.key,
    required this.item,
    required this.onDelete,
    required this.onDecrement,
    required this.onIncrement
  });

  final CartItem item;
  final Function onDecrement;
  final Function onIncrement;
  final Function onDelete;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 335,
      height: 136,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
              color: const Color.fromRGBO(224, 224, 224, 1),
              width: 1.0
          )
      ),
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 275,
                child: Text(item.service.name,
                    style: GoogleFonts.montserrat(
                        textStyle: const TextStyle(
                          fontSize: 16,
                          height: 1.25,
                          letterSpacing: 16.0 * -0.0032,
                        )
                    )
                ),
              ),
              GestureDetector(
                onTap: () => onDelete(),
                child: const Icon(
                  Icons.close_rounded,
                  size: 20,
                  color: Color.fromRGBO(126, 126, 154, 1)
                )
              )
            ],
          ),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("${item.service.price * item.patients} ₽",
                    style: GoogleFonts.montserrat(
                        textStyle: const TextStyle(
                            height: 1.5,
                            fontSize: 17
                        )
                    )
                ),
                Row(
                  children: [
                    Text(getPatientsText(item.patients),
                        style: GoogleFonts.montserrat(
                            textStyle: const TextStyle(
                                height: 20 / 15,
                                fontSize: 15,
                              fontWeight: FontWeight.w300
                            )
                        )
                    ),
                    const SizedBox(width: 16),
                    Incrementor(onDecrement: onDecrement, onIncrement: onIncrement)
                  ],
                ),
              ]
          ),
        ],
      ),
    );
  }
}
