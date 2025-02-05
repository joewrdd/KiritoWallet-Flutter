import 'package:crypto_wallet/models/coinModel.dart';
import 'package:crypto_wallet/services/api_service.dart';
import 'package:crypto_wallet/views/components/recom_item.dart';
import 'package:crypto_wallet/views/selectedCoin.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:async';
import 'package:crypto_wallet/models/transactionModel.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen>
    with SingleTickerProviderStateMixin {
  bool isLoading = true;
  List<CoinModel>? coinMarket;
  TextEditingController searchController = TextEditingController();
  bool _mounted = true;
  ScrollController _scrollController = ScrollController();
  late AnimationController _animationController;
  bool _isUserScrolling = false;
  double _lastAnimationValue = 0.0;
  CoinModel? searchedCoin;
  final List<TransactionModel> transactions =
      TransactionModel.getDummyTransactions();

  @override
  void initState() {
    super.initState();
    getCoins();

    _animationController = AnimationController(
      duration: const Duration(seconds: 20),
      vsync: this,
    )..addListener(() {
        if (_scrollController.hasClients && !_isUserScrolling) {
          final maxScrollExtent = _scrollController.position.maxScrollExtent;
          final currentPosition = _animationController.value * maxScrollExtent;
          _scrollController.jumpTo(currentPosition);
        }
      });

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _startScrolling();
    });
  }

  void _startScrolling() {
    if (!_isUserScrolling) {
      _animationController
        ..value = _lastAnimationValue
        ..repeat();
    }
  }

  void _stopScrolling() {
    _lastAnimationValue = _animationController.value;
    _animationController.stop();
  }

  void _updateAnimationFromScroll() {
    if (_scrollController.hasClients &&
        _scrollController.position.maxScrollExtent > 0) {
      _lastAnimationValue =
          _scrollController.offset / _scrollController.position.maxScrollExtent;
    }
  }

  @override
  void dispose() {
    _mounted = false;
    searchController.dispose();
    _scrollController.dispose();
    _animationController.dispose();
    super.dispose();
  }

  Future<void> getCoins() async {
    coinMarket = await ApiService.getCoinMarket();
    if (_mounted) {
      setState(() {
        isLoading = false;
      });
    }
  }

  void _handleSearch(String query) {
    if (query.isEmpty) return;

    query = query.toLowerCase();

    searchedCoin = coinMarket?.firstWhere(
      (coin) =>
          coin.id.toLowerCase() == query ||
          coin.name.toLowerCase() == query ||
          coin.symbol.toLowerCase() == query,
      // ignore: cast_from_null_always_fails
      orElse: () => null as CoinModel,
    );

    if (searchedCoin != null) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => SelectedCoinScreen(
            selectItem: searchedCoin,
          ),
        ),
      );
      searchController.clear();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Coin Not Found',
            style: GoogleFonts.pressStart2p(fontSize: 12),
          ),
          backgroundColor: Colors.red.withOpacity(0.8),
          duration: const Duration(seconds: 5),
        ),
      );
    }
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
                SizedBox(height: myHeight * 0.02),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: myWidth * 0.07),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    decoration: BoxDecoration(
                      color: Colors.cyanAccent.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: const Color(0xEEFAFA33)),
                    ),
                    child: TextField(
                      cursorColor: const Color(0xEEFAFA33),
                      controller: searchController,
                      style: GoogleFonts.pressStart2p(
                        color: Colors.black,
                        fontSize: 12,
                      ),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        icon:
                            const Icon(Icons.search, color: Color(0xEEFAFA33)),
                        hintText: 'Search Coins...',
                        hintStyle: GoogleFonts.pressStart2p(
                          color: const Color(0xEEFAFA33).withOpacity(0.5),
                          fontSize: 10,
                        ),
                      ),
                      onSubmitted: _handleSearch,
                      textInputAction: TextInputAction.search,
                    ),
                  ),
                ),
                SizedBox(height: myHeight * 0.02),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: myWidth * 0.08),
                  child: Row(
                    children: [
                      Text(
                        'RECOMMENDED TO BUY',
                        style: GoogleFonts.pressStart2p(
                            fontSize: 13,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: myHeight * 0.02),
                if (isLoading)
                  const Center(
                    child: CircularProgressIndicator(
                      color: Colors.cyanAccent,
                    ),
                  )
                else if (coinMarket == null || coinMarket!.isEmpty)
                  Center(
                    child: Text(
                      'No Coin Found',
                      style: GoogleFonts.pressStart2p(
                        color: Colors.white,
                        fontSize: 12,
                      ),
                    ),
                  )
                else
                  SizedBox(
                    height: myHeight * 0.225,
                    child: Padding(
                      padding: EdgeInsets.only(left: myWidth * 0.03),
                      child: Listener(
                        onPointerDown: (_) {
                          setState(() {
                            _isUserScrolling = true;
                            _stopScrolling();
                          });
                        },
                        onPointerUp: (_) {
                          _updateAnimationFromScroll();
                          setState(() {
                            _isUserScrolling = false;
                            _startScrolling();
                          });
                        },
                        child: NotificationListener<ScrollNotification>(
                          onNotification: (notification) {
                            if (_isUserScrolling) {
                              _updateAnimationFromScroll();
                            }
                            return true;
                          },
                          child: ListView.builder(
                            controller: _scrollController,
                            scrollDirection: Axis.horizontal,
                            physics: const BouncingScrollPhysics(),
                            itemCount: 7,
                            itemBuilder: (ctx, index) {
                              return RecomItem(
                                item: coinMarket![index],
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                SizedBox(height: myHeight * 0.0005),
                Column(
                  children: [
                    Container(
                      height: myHeight * 0.15,
                      width: myWidth,
                      child: Image.asset('assets/images/ghostgif.gif'),
                    ),
                    Text(
                      'Kirito Is The Future...',
                      style: GoogleFonts.silkscreen(
                        color: const Color(0xEEFAFA33),
                        fontSize: 28,
                        fontWeight: FontWeight.normal,
                        shadows: [
                          BoxShadow(
                            spreadRadius: 2,
                            color: Colors.black,
                            offset: Offset(1, 1),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: myHeight * 0.005,
                    ),
                    Column(
                      children: [
                        Text(
                          "Search Cryptocurrencies",
                          style: GoogleFonts.pressStart2p(
                            color: const Color.fromARGB(250, 4, 245, 249),
                            fontSize: 8,
                            fontWeight: FontWeight.normal,
                            shadows: [
                              BoxShadow(
                                spreadRadius: 2,
                                color: Colors.black,
                                offset: Offset(1, 1),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: myHeight * 0.001,
                        ),
                        Text(
                          "To Your Heart's Desire",
                          style: GoogleFonts.pressStart2p(
                            color: const Color.fromARGB(250, 4, 245, 249),
                            fontSize: 8,
                            fontWeight: FontWeight.normal,
                            shadows: [
                              BoxShadow(
                                spreadRadius: 2,
                                color: Colors.black,
                                offset: Offset(1, 1),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: myHeight * 0.02),
                //Top Coins
                SizedBox(
                  height: myHeight * 0.04,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: myWidth * 0.08),
                  child: Row(
                    children: [
                      Text(
                        'RECENT TRANSACTIONS',
                        style: GoogleFonts.pressStart2p(
                          fontSize: 13,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: myHeight * 0.02),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: myWidth * 0.05),
                  child: Column(
                    children: transactions.map((transaction) {
                      return Container(
                        margin: EdgeInsets.only(bottom: myHeight * 0.02),
                        padding: EdgeInsets.all(myWidth * 0.04),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: Colors.black.withOpacity(0.5),
                            width: 2,
                          ),
                        ),
                        child: Row(
                          children: [
                            Container(
                              padding: EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: transaction.color.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(
                                  color: transaction.color.withOpacity(0.5),
                                  width: 1,
                                ),
                              ),
                              child: Image.asset(
                                transaction.image,
                                width: 24,
                                height: 24,
                              ),
                            ),
                            SizedBox(width: myWidth * 0.04),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    transaction.type
                                        .toString()
                                        .split('.')
                                        .last
                                        .toUpperCase(),
                                    style: GoogleFonts.pressStart2p(
                                      fontSize: 10,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(height: 4),
                                  Text(
                                    transaction.description,
                                    style: GoogleFonts.pressStart2p(
                                      fontSize: 8,
                                      color: Colors.black54,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  '${transaction.type == TransactionType.transfer ? "-" : "+"}\$${transaction.amount.toStringAsFixed(2)}',
                                  style: GoogleFonts.pressStart2p(
                                    fontSize: 10,
                                    color: transaction.type ==
                                            TransactionType.transfer
                                        ? Colors.red
                                        : Colors.green,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 4),
                                Text(
                                  transaction.date,
                                  style: GoogleFonts.pressStart2p(
                                    fontSize: 8,
                                    color: Colors.black54,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    }).toList(),
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
