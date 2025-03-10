import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:crypto_wallet/services/api_service.dart';
import 'package:crypto_wallet/views/widgets/item.dart';

class TopCoinsScreen extends StatefulWidget {
  const TopCoinsScreen({super.key});

  @override
  State<TopCoinsScreen> createState() => _TopCoinsScreenState();
}

class _TopCoinsScreenState extends State<TopCoinsScreen> {
  bool isRefreshing = true;
  List? coinMarket = [];

  Future<void> getTopCoins() async {
    setState(() {
      isRefreshing = true;
    });

    var allCoins = await ApiService.getCoinMarket();
    if (allCoins != null) {
      coinMarket = allCoins
          .where((coin) => coin.marketCapChangePercentage24H > 0)
          .toList();

      coinMarket!.sort((a, b) => b.marketCapChangePercentage24H
          .compareTo(a.marketCapChangePercentage24H));
    }

    setState(() {
      isRefreshing = false;
    });
  }

  @override
  void initState() {
    getTopCoins();
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
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: myWidth * 0.05,
                  vertical: myHeight * 0.01,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: const Icon(
                        Icons.arrow_back_ios,
                        color: Colors.black87,
                        size: 20,
                      ),
                    ),
                    Text(
                      'TOP PERFORMING',
                      style: GoogleFonts.pressStart2p(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(width: 40), // Balance for back button
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(top: myHeight * 0.01),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.white.withOpacity(0.2),
                        Colors.white.withOpacity(0.1)
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40),
                    ),
                  ),
                  child: isRefreshing
                      ? const Center(
                          child: CircularProgressIndicator(
                            color: Colors.cyanAccent,
                          ),
                        )
                      : ListView.builder(
                          padding: EdgeInsets.only(top: myHeight * 0.02),
                          itemCount: coinMarket?.length ?? 0,
                          itemBuilder: (context, index) {
                            return Item(item: coinMarket![index]);
                          },
                        ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
