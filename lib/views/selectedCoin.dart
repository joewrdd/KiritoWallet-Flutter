import 'package:crypto_wallet/models/chartModel.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:crypto_wallet/services/api_service.dart';

// ignore: must_be_immutable
class SelectedCoinScreen extends StatefulWidget {
  var selectItem;

  SelectedCoinScreen({this.selectItem});

  @override
  State<SelectedCoinScreen> createState() => _SelectedCoinScreenState();
}

class _SelectedCoinScreenState extends State<SelectedCoinScreen> {
  List<ChartModel>? itemChart;
  late TrackballBehavior trackballBehavior;
  List<String> text = ['D', 'W', 'M', '3M', '6M', 'Y'];
  List<bool> textBool = [false, false, true, false, false, false];

  bool isLoading = true;
  String selectedDuration = '1';

  Future<void> getChart() async {
    setState(() {
      isLoading = true;
    });

    try {
      final data =
          await ApiService.getCoinChart(widget.selectItem.id, selectedDuration);
      setState(() {
        itemChart = data;
        isLoading = false;
      });
    } catch (e) {
      print('Error loading chart: $e');
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  void initState() {
    getChart();
    trackballBehavior = TrackballBehavior(
        enable: true, activationMode: ActivationMode.singleTap);
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
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: myWidth * 0.05, vertical: myHeight * 0.02),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            height: myHeight * 0.08,
                            child: Image.network(widget.selectItem.image),
                          ),
                          SizedBox(
                            width: myWidth * 0.03,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.selectItem.name,
                                style: GoogleFonts.pressStart2p(
                                    fontSize: 13,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontStyle: FontStyle.italic),
                              ),
                              Text(
                                widget.selectItem.symbol,
                                style: GoogleFonts.pressStart2p(
                                    fontSize: 10,
                                    color: Colors.cyanAccent,
                                    fontWeight: FontWeight.bold,
                                    fontStyle: FontStyle.normal),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            '\$' + widget.selectItem.currentPrice.toString(),
                            style: GoogleFonts.pressStart2p(
                                fontSize: 12,
                                color: Colors.black,
                                fontWeight: FontWeight.normal,
                                fontStyle: FontStyle.normal),
                          ),
                          SizedBox(
                            height: myHeight * 0.005,
                          ),
                          Text(
                            widget.selectItem.marketCapChangePercentage24H
                                    .toString() +
                                '\%',
                            style: GoogleFonts.pressStart2p(
                                fontSize: 9,
                                color: widget.selectItem
                                            .marketCapChangePercentage24H >=
                                        0
                                    ? Colors.green
                                    : Colors.redAccent,
                                fontWeight: FontWeight.bold,
                                fontStyle: FontStyle.italic),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 2,
                  width: myWidth,
                  child: Image.asset(
                    'assets/images/cyanline.gif',
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(
                  height: myHeight * 0.01,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: myWidth * 0.05, vertical: myHeight * 0.02),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Text(
                            'Low',
                            style: GoogleFonts.dotGothic16(
                                fontSize: 20,
                                color: Colors.black,
                                fontWeight: FontWeight.normal,
                                fontStyle: FontStyle.italic),
                          ),
                          SizedBox(
                            height: myHeight * 0.01,
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: myWidth * 0.03,
                              vertical: myHeight * 0.01,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: Colors.cyanAccent.withOpacity(0.8),
                            ),
                            child: Text(
                              '\$' + widget.selectItem.low24H.toString(),
                              style: GoogleFonts.pressStart2p(
                                  fontSize: 10,
                                  color: Colors.black,
                                  fontWeight: FontWeight.normal,
                                  fontStyle: FontStyle.normal),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: myWidth * 0.01,
                      ),
                      Column(
                        children: [
                          Text(
                            'High',
                            style: GoogleFonts.dotGothic16(
                                fontSize: 20,
                                color: Colors.black,
                                fontWeight: FontWeight.normal,
                                fontStyle: FontStyle.italic),
                          ),
                          SizedBox(
                            height: myHeight * 0.01,
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: myWidth * 0.01,
                              vertical: myHeight * 0.01,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: Colors.cyanAccent.withOpacity(0.8),
                            ),
                            child: Text(
                              '\$' + widget.selectItem.high24H.toString(),
                              style: GoogleFonts.pressStart2p(
                                  fontSize: 10,
                                  color: Colors.black,
                                  fontWeight: FontWeight.normal,
                                  fontStyle: FontStyle.normal),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: myWidth * 0.01,
                      ),
                      Column(
                        children: [
                          Text(
                            'Vol',
                            style: GoogleFonts.dotGothic16(
                                fontSize: 20,
                                color: Colors.black,
                                fontWeight: FontWeight.normal,
                                fontStyle: FontStyle.italic),
                          ),
                          SizedBox(
                            height: myHeight * 0.01,
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: myWidth * 0.03,
                              vertical: myHeight * 0.01,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: Colors.cyanAccent.withOpacity(0.8),
                            ),
                            child: Text(
                              '\$' +
                                  (widget.selectItem.totalVolume / 1000000)
                                      .toStringAsFixed(2) +
                                  'M',
                              style: GoogleFonts.pressStart2p(
                                  fontSize: 10,
                                  color: Colors.black,
                                  fontWeight: FontWeight.normal,
                                  fontStyle: FontStyle.normal),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: myHeight * 0.005,
                ),
                Container(
                  height: myHeight * 0.4,
                  width: myWidth,
                  child: isLoading
                      ? const Center(
                          child: CircularProgressIndicator(
                          color: Colors.cyanAccent,
                        ))
                      : itemChart == null
                          ? Center(
                              child: Text(
                                'No Chart Data Available',
                                style: GoogleFonts.pressStart2p(
                                    color: Colors.cyanAccent),
                              ),
                            )
                          : SfCartesianChart(
                              trackballBehavior: trackballBehavior,
                              zoomPanBehavior: ZoomPanBehavior(
                                  enablePanning: true, zoomMode: ZoomMode.x),
                              series: <CandleSeries>[
                                CandleSeries<ChartModel, int>(
                                  enableSolidCandles: true,
                                  enableTooltip: true,
                                  bullColor: Colors.green,
                                  bearColor: Colors.red,
                                  dataSource: itemChart!,
                                  xValueMapper: (ChartModel sales, _) =>
                                      sales.time,
                                  lowValueMapper: (ChartModel sales, _) =>
                                      sales.low,
                                  highValueMapper: (ChartModel sales, _) =>
                                      sales.high,
                                  openValueMapper: (ChartModel sales, _) =>
                                      sales.open,
                                  closeValueMapper: (ChartModel sales, _) =>
                                      sales.close,
                                  animationDuration: 55,
                                ),
                              ],
                            ),
                ),
                SizedBox(
                  height: myHeight * 0.01,
                ),
                Container(
                  padding: EdgeInsets.only(left: 45),
                  height: myHeight * 0.03,
                  width: myWidth,
                  child: Row(
                    children: [
                      Expanded(
                        child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: text.length,
                          itemBuilder: (ctx, index) {
                            return GestureDetector(
                              onTap: () {
                                setState(() {
                                  // Reset all buttons to false
                                  for (int i = 0; i < textBool.length; i++) {
                                    textBool[i] = false;
                                  }
                                  // Set the tapped button to true
                                  textBool[index] = true;

                                  switch (text[index]) {
                                    case 'D':
                                      selectedDuration = '1';
                                      break;
                                    case 'W':
                                      selectedDuration = '7';
                                      break;
                                    case 'M':
                                      selectedDuration = '30';
                                      break;
                                    case '3M':
                                      selectedDuration = '90';
                                      break;
                                    case '6M':
                                      selectedDuration = '180';
                                      break;
                                    case 'Y':
                                      selectedDuration = '365';
                                      break;
                                  }
                                  getChart();
                                });
                              },
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: myWidth * 0.02),
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: myWidth * 0.03,
                                    vertical: myHeight * 0.0070,
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: textBool[index] == true
                                        ? Color(0xEEFAFA33).withOpacity(
                                            0.8,
                                          )
                                        : Colors.transparent,
                                  ),
                                  child: Text(
                                    text[index],
                                    style: GoogleFonts.pressStart2p(
                                        fontSize: 10,
                                        color: Colors.black,
                                        fontWeight: FontWeight.normal,
                                        fontStyle: FontStyle.normal),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: myHeight * 0.05,
                ),
                // News Section
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: myWidth * 0.05),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: myWidth * 0.03,
                              vertical: myHeight * 0.005,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: Colors.cyanAccent.withOpacity(0.8),
                            ),
                            child: Text(
                              'NEWS',
                              style: GoogleFonts.pressStart2p(
                                fontSize: 13,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: myHeight * 0.02),
                      Container(
                        padding: EdgeInsets.all(myWidth * 0.04),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Color(0xEEFAFA33).withOpacity(0.3),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Market Update',
                              style: GoogleFonts.pressStart2p(
                                fontSize: 12,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: myHeight * 0.01),
                            Text(
                              '${widget.selectItem.name} (${widget.selectItem.symbol.toUpperCase()}) is currently ranked #${widget.selectItem.marketCapRank} in the crypto market. The coin is trading at \$${widget.selectItem.currentPrice} with a 24h price change of ${widget.selectItem.priceChangePercentage24H.toStringAsFixed(2)}%.',
                              style: GoogleFonts.pressStart2p(
                                fontSize: 8,
                                color: Colors.black87,
                                height: 1.5,
                              ),
                            ),
                            SizedBox(height: myHeight * 0.02),
                            Text(
                              '24h Trading Activity',
                              style: GoogleFonts.pressStart2p(
                                fontSize: 12,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: myHeight * 0.01),
                            Text(
                              'In the last 24 hours, ${widget.selectItem.id} reached a high of \$${widget.selectItem.high24H} and a low of \$${widget.selectItem.low24H}. The trading volume has reached \$${(widget.selectItem.totalVolume / 1000000).toStringAsFixed(2)}M with a price change of \$${widget.selectItem.priceChange24H.toStringAsFixed(2)}.',
                              style: GoogleFonts.pressStart2p(
                                fontSize: 8,
                                color: Colors.black87,
                                height: 1.5,
                              ),
                            ),
                            SizedBox(height: myHeight * 0.02),
                            Text(
                              'Market Performance',
                              style: GoogleFonts.pressStart2p(
                                fontSize: 12,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: myHeight * 0.01),
                            Text(
                              'The market cap has shown a ${widget.selectItem.marketCapChangePercentage24H >= 0 ? 'positive' : 'negative'} change of ${widget.selectItem.marketCapChangePercentage24H.toStringAsFixed(2)}% in the last 24 hours. The 7-day price trend shows ${widget.selectItem.sparklineIn7D.price.last > widget.selectItem.sparklineIn7D.price.first ? 'an upward' : 'a downward'} movement.',
                              style: GoogleFonts.pressStart2p(
                                fontSize: 8,
                                color: Colors.black87,
                                height: 1.5,
                              ),
                            ),
                            SizedBox(height: myHeight * 0.02),
                          ],
                        ),
                      ),
                      SizedBox(height: myHeight * 0.01),
                      Container(
                        width: myWidth * 0.4,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.symmetric(
                              vertical: myHeight * 0.015,
                            ),
                            backgroundColor: Colors.cyanAccent.withOpacity(0.8),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: Text(
                            'Go Back',
                            style: GoogleFonts.pressStart2p(
                              fontSize: 12,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: myHeight * 0.05),
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
