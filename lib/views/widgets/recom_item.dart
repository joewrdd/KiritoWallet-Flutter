import 'package:crypto_wallet/views/selectedCoin.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class RecomItem extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  var item;

  RecomItem({super.key, this.item});

  @override
  Widget build(BuildContext context) {
    double myHeight = MediaQuery.of(context).size.height;
    double myWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: myWidth * 0.03,
        vertical: myHeight * 0.01,
      ),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (ctx) => SelectedCoinScreen(
                selectItem: item,
              ),
            ),
          );
        },
        child: Container(
          padding: EdgeInsets.only(
              left: myWidth * 0.03,
              right: myHeight * 0.03,
              top: myHeight * 0.02,
              bottom: myHeight * 0.02),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                blurRadius: 5,
                color: Colors.white.withOpacity(0.3),
                offset: Offset(0, 3),
              ),
            ],
            border: Border.all(
              color: Colors.yellowAccent,
              width: 2.5,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: myHeight * 0.03,
                child: Image.network(item.image),
              ),
              SizedBox(
                height: myHeight * 0.02,
              ),
              Text(
                item.name,
                style: GoogleFonts.pressStart2p(
                    fontSize: 13,
                    color: Colors.black,
                    fontWeight: FontWeight.normal),
              ),
              SizedBox(
                height: myHeight * 0.01,
              ),
              Row(
                children: [
                  Text(
                    '\$${item.currentPrice.toStringAsFixed(2)}',
                    style: GoogleFonts.audiowide(
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                ],
              ),
              SizedBox(height: myHeight * 0.01),
              Row(
                children: [
                  Text(
                    item.priceChange24H.toString().contains('-')
                        ? "- \$${item.priceChange24H.toStringAsFixed(2).toString().replaceAll('-', '')} P.C"
                        : '\$${item.priceChange24H.toStringAsFixed(2)}' ' P.C',
                    style: GoogleFonts.audiowide(
                        fontSize: 10,
                        fontWeight: FontWeight.normal,
                        color: Colors.black54),
                  ),
                  SizedBox(
                    width: myWidth * 0.03,
                  ),
                  Text(
                    '${item.priceChangePercentage24H.toStringAsFixed(2)}%',
                    style: GoogleFonts.audiowide(
                        fontSize: 10,
                        fontWeight: FontWeight.normal,
                        color: item.priceChangePercentage24H >= 0
                            ? Colors.green
                            : Colors.red),
                  ),
                ],
              ),
              SizedBox(height: myHeight * 0.01),
              Row(
                children: [
                  Text(
                    'Rank: ${item.marketCapRank.toString()}',
                    style: GoogleFonts.audiowide(
                        fontSize: 10,
                        fontWeight: FontWeight.normal,
                        color: Colors.black87),
                  ),
                  SizedBox(width: myWidth * 0.03),
                  Text(
                    'Vol: \$${(item.totalVolume / 1000000).toStringAsFixed(1)}M',
                    style: GoogleFonts.audiowide(
                        fontSize: 10,
                        fontWeight: FontWeight.normal,
                        color: Colors.black54),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
