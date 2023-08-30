import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'home_screen.dart';

class IntroScreen extends StatefulWidget {
  @override
  _IntroScreenState createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        decoration: BoxDecoration(color: Color(0x1AC8CE07)),
        child: Stack(
          children: [
            Positioned.fill(
              top: -225,
              left: -60,
              child: ClipPath(
                clipper: PyramidClipper(),
                child: Image.asset(
                  "images/bgIntroPhoto.jpg",
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 260,
              child: Image.asset(
                "images/logo.png",
                width: 100,
                height: 156,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 50),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Spacer(),
                  Center(
                    child: Text(
                      "Discover easy recipes, \n choose what you \n love to eat!",
                      textAlign: TextAlign.left,
                      style: GoogleFonts.dancingScript().copyWith(
                        color: Colors.darkOrange,
                        fontSize: 33,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 18),
                    child: MouseRegion(
                      onEnter: (_) => setState(() => isHovered = true),
                      onExit: (_) => setState(() => isHovered = false),
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => HomeScreen(),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              isHovered ? Colors.redAccent : Colors.orange,
                          padding: EdgeInsets.symmetric(
                              horizontal: 115, vertical: 15),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        child: Text("Get started",
                            style: GoogleFonts.jaldi().copyWith(
                              color: Colors.white,
                              fontSize: 21,
                            )),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class PyramidClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.moveTo(0, 0);
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height * 0.5);
    path.lineTo(size.width * 0.56, size.height * 0.59);
    path.lineTo(0, size.height * 0.5);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
