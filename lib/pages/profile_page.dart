import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../models/profile.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({super.key, required this.profile});

  final Profile profile;

  final List<Map<String, String>> sections = [
    {
      "img": "assets/images/Icon_1.png",
      "section": "Мои заказы",
    },
    {
      "img": "assets/images/Icon_2.png",
      "section": "Медицинские карты",
    },
    {
      "img": "assets/images/Icon_3.png",
      "section": "Мои адреса",
    },
    {
      "img": "assets/images/Icon_4.png",
      "section": "Настройки",
    }
  ];

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(
              top: 48.0,
              left: 27.0,
              right: 27.0
          ),
          child: ListView(
            children: [
              Text(profile.name,
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
              Text(profile.phone,
                  textAlign: TextAlign.left,
                  style: GoogleFonts.montserrat(
                      textStyle: const TextStyle(
                        color: Color.fromRGBO(137, 138, 141, 1),
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        height: 16 / 15,
                        letterSpacing: 15.0 * 0.0033,
                      )
                  )
              ),
              const SizedBox(height: 16),
              Text(profile.email,
                  textAlign: TextAlign.left,
                  style: GoogleFonts.montserrat(
                      textStyle: const TextStyle(
                        color: Color.fromRGBO(137, 138, 141, 1),
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        height: 16 / 15,
                        letterSpacing: 15.0 * 0.0033,
                      )
                  )
              ),
              const SizedBox(height: 64),
              ...sections.map((item) {
                return Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 16
                  ),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(
                            item["img"]!,
                            width: 32,
                            height: 32,
                            fit: BoxFit.cover
                        ),
                        const SizedBox(width: 20),
                        Text(item["section"]!,
                            style: GoogleFonts.montserrat(
                                textStyle: const TextStyle(
                                  fontSize: 17,
                                  height: 24 / 17,
                                )
                            )
                        )
                      ]
                  ),
                );
              }),
            const SizedBox(height: 48),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 20,
                  child: TextButton(
                      onPressed: (){},
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.zero,
                        minimumSize: const Size(0, 0)
                      ),
                      child: Text("Ответы на вопросы",
                          textAlign: TextAlign.left,
                          style: GoogleFonts.montserrat(
                              textStyle: const TextStyle(
                                color: Color.fromRGBO(147, 147, 150, 1),
                                fontSize: 15,
                                fontWeight: FontWeight.w300,
                                height: 20 / 15,
                              )
                          )
                      )
                  ),
                ),
                const SizedBox(height: 24),
                SizedBox(
                  height: 20,
                  child: TextButton(
                      onPressed: (){},
                      style: TextButton.styleFrom(
                          padding: EdgeInsets.zero,
                          minimumSize: const Size(0, 0)
                      ),
                      child: Text("Политика конфиденциальности",
                          style: GoogleFonts.montserrat(
                              textStyle: const TextStyle(
                                color: Color.fromRGBO(147, 147, 150, 1),
                                fontSize: 15,
                                fontWeight: FontWeight.w300,
                                height: 20 / 15,
                              )
                          )
                      )
                  ),
                ),
                const SizedBox(height: 24),
                SizedBox(
                  height: 20,
                  child: TextButton(
                      onPressed: (){},
                      style: TextButton.styleFrom(
                          padding: EdgeInsets.zero,
                          minimumSize: const Size(0, 0)
                      ),
                      child: Text("Пользовательское соглашение",
                          style: GoogleFonts.montserrat(
                              textStyle: const TextStyle(
                                color: Color.fromRGBO(147, 147, 150, 1),
                                fontSize: 15,
                                fontWeight: FontWeight.w300,
                                height: 20 / 15,
                              )
                          )
                      )
                  ),
                ),
                const SizedBox(height: 24),
                SizedBox(
                  height: 20,
                  child: TextButton(
                      onPressed: (){},
                      style: TextButton.styleFrom(
                          padding: EdgeInsets.zero,
                          minimumSize: const Size(0, 0)
                      ),
                      child: Text("Выход",
                          style: GoogleFonts.montserrat(
                              textStyle: const TextStyle(
                                color: Color.fromRGBO(253, 53, 53, 1),
                                fontSize: 15,
                                fontWeight: FontWeight.w300,
                                height: 20 / 15,
                              )
                          )
                      )
                  ),
                )

              ],
            )
            ],
          ),)
    );
  }
}
