import 'package:flutter/material.dart';
import '../models/service.dart';
import 'package:google_fonts/google_fonts.dart';
import '../utils.dart';


class ServiceCard extends StatelessWidget {
  const ServiceCard({
    super.key,
    required this.service,
    required this.onAdd
  });

  final Service service;
  final Function onAdd;

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
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(service.name,
            style: GoogleFonts.montserrat(
              textStyle: const TextStyle(
                fontSize: 16,
                height: 1.25,
                letterSpacing: 16.0 * -0.0032,
              )
            )
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(getDaysText(service.due),
                      style: GoogleFonts.montserrat(
                          textStyle: const TextStyle(
                            fontSize: 14,
                            height: 1.25,
                            color: Color.fromRGBO(147, 147, 150, 1),
                          )
                      )
                  ),
                  const SizedBox(height: 4.0),
                  Text("${service.price} ₽",
                      style: GoogleFonts.montserrat(
                          textStyle: const TextStyle(
                            height: 1.5,
                            fontSize: 17
                          )
                      )
                  ),
                ],
              ),
              SizedBox(
                child: ElevatedButton(
                    onPressed: () => onAdd(),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromRGBO(26, 111, 238, 1),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12.5),
                    ),
                    child: Text("Добавить",
                        style: GoogleFonts.montserrat(
                            textStyle: const TextStyle(
                              fontWeight: FontWeight.w500,
                              height: 20/14,
                              fontSize: 14,
                              color: Colors.white,
                            )
                        )
                    )
                ),
              )
            ]
          )
        ],
      ),
    );
  }
}

