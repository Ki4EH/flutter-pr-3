import 'package:flutter/material.dart';

class Incrementor extends StatelessWidget {
  final Function onDecrement;
  final Function onIncrement;

  const Incrementor({
    super.key,
    required this.onDecrement,
    required this.onIncrement
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 32,
      width: 64,
      decoration: BoxDecoration(
        color: const Color.fromRGBO(245, 245, 249, 1.0),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () => onDecrement(),
            child: const Icon(
              Icons.remove_rounded,
              size: 20,
              color: Color.fromRGBO(184, 193, 204, 1)
            )
          ),
          Container(
            width: 0,
            height: 16,
            decoration: BoxDecoration(
                border: Border.all(
                  color: const Color.fromRGBO(235, 235, 235, 1.0),
                  width: 1.0,
                )
            ),
          ),
          GestureDetector(
              onTap: () => onIncrement(),
              child: const Icon(
                  Icons.add_rounded,
                  size: 20,
                  color: Color.fromRGBO(147, 147, 150, 1)
              )
          )
        ],
      )
    );
  }
}
