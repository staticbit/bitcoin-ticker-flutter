import 'package:http/http.dart' as http;
import 'dart:convert';

const List<String> currenciesList = [
  'AUD',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JPY',
  'MXN',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'USD',
  'ZAR'
];

const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
];

class CoinData {
  String price = '?';

  Future<String> getCoinData(String cryptoCurrency, String realCurrency) async {
    String url =
        'https://apiv2.bitcoinaverage.com/indices/global/ticker/$cryptoCurrency$realCurrency';
    var response = await _getResponse(url);

    if (response == null) {
      price = '?';
    } else {
      double priceDouble = jsonDecode(response)['last'];
      price = priceDouble.floor().toString();
    }

    return price;
  }

  _getResponse(String url) async {
    http.Response response = await http.get(url);
    print(response);

    if (response.statusCode == 200) {
      return response.body;
    } else {
      print(response.statusCode);
    }
  }
}
