import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:crypto_wallet/models/newsModel.dart';
import 'package:crypto_wallet/services/api_service.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({super.key});

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  List<NewsModel> newsList = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    getNews();
  }

  Future<void> getNews() async {
    setState(() {
      isLoading = true;
    });

    try {
      final news = await ApiService.getCryptoNews();
      setState(() {
        newsList = news;
        isLoading = false;
      });
    } catch (e) {
      print('Error: $e');
      setState(() {
        isLoading = false;
      });
    }
  }

  Future<void> _launchUrl(String url) async {
    if (!await launchUrl(Uri.parse(url))) {
      throw Exception('Could Not Launch $url');
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
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: myWidth * 0.05,
                  vertical: myHeight * 0.02,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: myWidth * 0.03,
                        vertical: myHeight * 0.005,
                      ),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.cyanAccent.withOpacity(0.8),
                          border: Border.all(
                            width: 2,
                          )),
                      child: Text(
                        'CRYPTO NEWS',
                        style: GoogleFonts.pressStart2p(
                          fontSize: 13,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: isLoading
                    ? const Center(
                        child: CircularProgressIndicator(
                          color: Colors.cyanAccent,
                        ),
                      )
                    : newsList.isEmpty
                        ? Center(
                            child: Text(
                              'No News Available',
                              style: GoogleFonts.pressStart2p(
                                fontSize: 13,
                                color: Colors.black,
                              ),
                            ),
                          )
                        : RefreshIndicator(
                            color: Colors.black,
                            backgroundColor: Colors.yellowAccent,
                            onRefresh: getNews,
                            child: ListView.builder(
                              padding: EdgeInsets.symmetric(
                                horizontal: myWidth * 0.05,
                              ),
                              itemCount: newsList.length,
                              itemBuilder: (context, index) {
                                final news = newsList[index];
                                return GestureDetector(
                                  onTap: () => _launchUrl(news.link),
                                  child: Container(
                                    margin: EdgeInsets.only(
                                        bottom: myHeight * 0.02),
                                    padding: EdgeInsets.all(myWidth * 0.04),
                                    decoration: BoxDecoration(
                                      color: Colors.white.withOpacity(0.1),
                                      borderRadius: BorderRadius.circular(12),
                                      border: Border.all(
                                        color: Colors.black.withOpacity(0.5),
                                        width: 2,
                                      ),
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        if (news.imageUrl.isNotEmpty)
                                          ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            child: Image.network(
                                              news.imageUrl,
                                              height: myHeight * 0.2,
                                              width: double.infinity,
                                              fit: BoxFit.cover,
                                              errorBuilder:
                                                  (context, error, stackTrace) {
                                                return Container(
                                                  height: myHeight * 0.2,
                                                  color: Colors.grey
                                                      .withOpacity(0.3),
                                                  child: Icon(Icons.error),
                                                );
                                              },
                                            ),
                                          ),
                                        SizedBox(height: myHeight * 0.02),
                                        Text(
                                          news.title,
                                          style: GoogleFonts.pressStart2p(
                                            fontSize: 12,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        SizedBox(height: myHeight * 0.01),
                                        Text(
                                          news.description,
                                          style: GoogleFonts.pressStart2p(
                                            fontSize: 8,
                                            color: Colors.black87,
                                          ),
                                          maxLines: 3,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        SizedBox(height: myHeight * 0.01),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              news.source,
                                              style: GoogleFonts.pressStart2p(
                                                fontSize: 8,
                                                color: Colors.black54,
                                              ),
                                            ),
                                            Text(
                                              news.pubDate.split(' ')[0],
                                              style: GoogleFonts.pressStart2p(
                                                fontSize: 8,
                                                color: Colors.black54,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                );
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
