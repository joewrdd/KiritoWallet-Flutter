import 'package:crypto_wallet/views/components/item.dart';
import 'package:crypto_wallet/views/game.dart';
import 'package:crypto_wallet/views/selectedCoin.dart';
import 'package:crypto_wallet/views/top_coins.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:crypto_wallet/services/api_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isRefreshing = true;
  List? coinMarket = [];
  var coinMarketList;
  Future<void> getCoinMarket() async {
    setState(() {
      isRefreshing = true;
    });

    coinMarket = await ApiService.getCoinMarket();

    setState(() {
      isRefreshing = false;
    });
  }

  @override
  void initState() {
    getCoinMarket();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double myHeight = MediaQuery.of(context).size.height;
    double myWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        height: myHeight,
        width: myWidth,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              colors: [Color(0xEEFAFA33), Colors.cyanAccent],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: myHeight * 0.02,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: myWidth * 0.02,
                            vertical: myHeight * 0.001),
                        decoration: BoxDecoration(
                          color: Colors.cyanAccent.withOpacity(0.8),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Text(
                          "Main Portfolio",
                          style: GoogleFonts.pressStart2p(
                            fontSize: 9,
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const TopCoinsScreen()),
                          );
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: myWidth * 0.02,
                              vertical: myHeight * 0.001),
                          decoration: BoxDecoration(
                            color: Colors.cyanAccent.withOpacity(0.8),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Text(
                            "Top Coins",
                            style: GoogleFonts.pressStart2p(
                              fontSize: 9,
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const GameScreen(),
                            ),
                          );
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: myWidth * 0.02,
                              vertical: myHeight * 0.001),
                          decoration: BoxDecoration(
                            color: Colors.cyanAccent.withOpacity(0.8),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Text(
                            "Play a Game",
                            style: GoogleFonts.pressStart2p(
                              fontSize: 9,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: myWidth * 0.07),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '\$86,576.78',
                        style: GoogleFonts.pressStart2p(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(myWidth * 0.001),
                        height: myHeight * 0.08,
                        width: myWidth * 0.22,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          // color: Colors.white.withOpacity(0.4),
                        ),
                        child: Image.asset(
                          'assets/images/coin.gif',
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: myWidth * 0.07,
                  ),
                  child: Row(
                    children: [
                      Text(
                        '+91% All Time High',
                        style: GoogleFonts.audiowide(
                          color: Colors.black,
                          fontSize: 9,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: myHeight * 0.02,
                ),
                Container(
                  height: myHeight * 0.87,
                  width: myWidth,
                  decoration: const BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 5,
                        color: Colors.black12,
                        spreadRadius: 5,
                        offset: Offset(0, 3),
                      ),
                    ],
                    gradient: LinearGradient(
                        colors: [Color(0xEEFAFA33), Colors.cyanAccent],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(50),
                    ),
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        height: myHeight * 0.02,
                      ),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: myWidth * 0.08),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'ASSETS',
                              style: GoogleFonts.pressStart2p(
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.cyanAccent,
                                  fontStyle: FontStyle.italic),
                            ),
                            SizedBox(
                              height: 27,
                              width: 27,
                              child: IconButton(
                                padding: EdgeInsets.zero,
                                constraints: const BoxConstraints(),
                                onPressed: () {},
                                icon: Image.asset(
                                  'assets/icons/plus_icon.png',
                                  height: 18,
                                  width: 18,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: myHeight * 0.01,
                      ),
                      Expanded(
                        child: isRefreshing == true
                            ? const Center(
                                child: CircularProgressIndicator(
                                  color: Colors.cyanAccent,
                                ),
                              )
                            : coinMarket == null || coinMarket!.isEmpty
                                ? Center(
                                    child: Text(
                                      'No Data Available',
                                      style: GoogleFonts.pressStart2p(
                                        fontSize: 13,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.yellowAccent,
                                      ),
                                    ),
                                  )
                                : ListView.builder(
                                    itemCount: coinMarket!.length,
                                    itemBuilder: (ctx, index) {
                                      return GestureDetector(
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  SelectedCoinScreen(
                                                selectItem: coinMarket![index],
                                              ),
                                            ),
                                          );
                                        },
                                        child: Item(
                                          item: coinMarket![index],
                                        ),
                                      );
                                    },
                                  ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
