import 'package:chart_sparkline/chart_sparkline.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class Item extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  var item;

  Item({super.key, this.item});

  @override
  Widget build(BuildContext context) {
    double myHeight = MediaQuery.of(context).size.height;
    double myWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: myWidth * 0.02, vertical: myHeight * 0.008),
      child: Row(
        children: [
          SizedBox(
            height: myHeight * 0.06,
            child: Image.network(item.image),
          ),
          SizedBox(
            width: myWidth * 0.03,
          ),
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.name,
                  style: GoogleFonts.pressStart2p(
                      fontSize: 10, fontWeight: FontWeight.bold),
                ),
                Text(
                  // ignore: prefer_interpolation_to_compose_strings
                  '0.4 ' + item.symbol,
                  style: GoogleFonts.audiowide(
                      fontSize: 10,
                      fontWeight: FontWeight.normal,
                      color: Colors.black54),
                ),
              ],
            ),
          ),
          SizedBox(
            width: myWidth * 0.03,
          ),
          SizedBox(
            height: myHeight * 0.05,
            width: myWidth * 0.2,
            child: Sparkline(
              data: item.sparklineIn7D.price,
              lineWidth: 2.0,
              lineColor: item.marketCapChangePercentage24H >= 0
                  ? Colors.greenAccent
                  : Colors.redAccent,
              fillMode: FillMode.below,
              fillGradient: LinearGradient(
                colors: item.marketCapChangePercentage24H >= 0
                    ? [Colors.greenAccent, Colors.greenAccent.shade100]
                    : [Colors.redAccent, Colors.redAccent.shade100],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: const [0.0, 0.7],
              ),
            ),
          ),
          SizedBox(
            width: myWidth * 0.05,
          ),
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '\$${item.currentPrice.toString()}',
                  style: GoogleFonts.pressStart2p(
                      fontSize: 10, fontWeight: FontWeight.bold),
                ),
                Text(
                  '\$${item.priceChange24H.toStringAsFixed(2)}' ' P.C',
                  style: GoogleFonts.audiowide(
                      fontSize: 10,
                      fontWeight: FontWeight.normal,
                      color: Colors.black54),
                ),
                SizedBox(
                  width: myWidth * 0.03,
                ),
                Text(
                  item.marketCapChangePercentage24H.toStringAsFixed(2) +
                      '% ' +
                      ' M.C',
                  style: GoogleFonts.audiowide(
                      fontSize: 10,
                      fontWeight: FontWeight.normal,
                      color: item.marketCapChangePercentage24H >= 0
                          ? Colors.green
                          : Colors.red),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
