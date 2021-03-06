import 'dart:convert';
import 'package:http/http.dart' as http;

class StockApi {

  String search;
  String name;
  String ticker;
  double price;
  double variation;
  var stockList = [];

  Future<Map> getData(_search) async {
    if (_search != null && _search.toString().isNotEmpty) {
      print(_search);
      http.Response response = await http.get(
          "https://api.hgbrasil.com/finance/stock_price?key=aeedac9c&symbol=$_search");
      return json.decode(response.body);
    } else {
      return null;
    }
  }

  saveStockFields(snapshot) {
    name = snapshot.data["results"]["$search"]["name"];
    ticker = snapshot.data["results"]["$search"]["symbol"];
    price = snapshot.data["results"]["$search"]["price"];
    variation = snapshot.data["results"]["$search"]["change_percent"];
  }
}