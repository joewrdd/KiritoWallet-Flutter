import 'package:http/http.dart' as http;
import 'package:crypto_wallet/models/coinModel.dart';
import 'package:crypto_wallet/models/chartModel.dart';
import 'dart:convert';
import 'package:crypto_wallet/models/newsModel.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiService {
  static String get newsApiKey => dotenv.env['NEWS_API_KEY'] ?? '';

  static Future<List<CoinModel>?> getCoinMarket() async {
    try {
      const url =
          'https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&sparkline=true';

      var response = await http.get(Uri.parse(url), headers: {
        "Content-Type": "application/json",
        "Accept": "application/json"
      });

      if (response.statusCode == 200) {
        var coinMarketList = coinModelFromJson(response.body);
        return coinMarketList;
      }
    } catch (e) {
      print('Error fetching coin market data: $e');
    }
    return null;
  }

  static Future<List<ChartModel>?> getCoinChart(
      String coinId, String days) async {
    try {
      final url =
          'https://api.coingecko.com/api/v3/coins/$coinId/ohlc?vs_currency=usd&days=$days';

      var response = await http.get(Uri.parse(url), headers: {
        "Content-Type": "application/json",
        "Accept": "application/json",
      });

      if (response.statusCode == 200) {
        Iterable x = json.decode(response.body);
        List<ChartModel> modelList =
            x.map((e) => ChartModel.fromJson(e)).toList();
        return modelList;
      }
    } catch (e) {
      print('Error fetching coin chart data: $e');
    }
    return null;
  }

  static Future<List<NewsModel>> getCryptoNews() async {
    try {
      final response = await http.get(
        Uri.parse('https://newsdata.io/api/1/news?apikey=$newsApiKey&q=crypto'),
      );

      if (response.statusCode == 200) {
        final List<dynamic> newsJson = json.decode(response.body)['results'];
        return newsJson.map((json) => NewsModel.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load news');
      }
    } catch (e) {
      print('Error fetching news: $e');
      return [];
    }
  }
}
