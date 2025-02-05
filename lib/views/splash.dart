import 'package:crypto_wallet/views/navBar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  @override
  Widget build(BuildContext context) {
    double myHeight = MediaQuery.of(context).size.height;
    double myWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Container(
        height: myHeight,
        width: myWidth,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/pixelbg.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            Image.asset('assets/images/coin.gif'),
            const SizedBox(height: 50),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Kirito,The Future',
                  style: GoogleFonts.pressStart2p(
                      fontSize: 21,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                Text(
                  'Dive into the world of cryptocurrency',
                  style: GoogleFonts.pressStart2p(
                    fontSize: 7,
                    fontWeight: FontWeight.normal,
                    color: const Color(0xEEFAFA33),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 190,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: myWidth * 0.14),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (ctx) => const NavBar(),
                    ),
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color(0xEEFAFA33),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: myWidth * 0.05, vertical: myHeight * 0.013),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'CREATE PORTFOLIO  ',
                          style: GoogleFonts.orbitron(
                              fontSize: 15,
                              fontWeight: FontWeight.normal,
                              color: Colors.cyan),
                        ),
                        const RotationTransition(
                          turns: AlwaysStoppedAnimation(310 / 360),
                          child: Icon(
                            Icons.arrow_forward_rounded,
                            color: Colors.cyan,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
