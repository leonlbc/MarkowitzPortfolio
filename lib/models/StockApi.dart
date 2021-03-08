import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:witz/glitch/VerificationException.dart';

class StockApi {

  String search;
  String name;
  String ticker;
  double price;
  double variation;
  var stockList = [];

  getData(_search) async {
    if (_search != null && _search.toString().isNotEmpty) {
      print(_search);
      http.Response response = await http.get(
          "https://api.hgbrasil.com/finance/stock_price?key=aeedac9c&symbol=$_search");
      return json.decode(response.body);
    } else {
      return null;
    }
  }

  saveStockFields(data, search) {
    try{
      if (data["results"]["$search"]["price"] != null) {
        name = data["results"]["$search"]["name"];
        ticker = data["results"]["$search"]["symbol"];
        price = data["results"]["$search"]["price"];
        variation = data["results"]["$search"]["change_percent"];
      }
    }
    catch(e){
      VerificationException("Stock Not Found");
    }
  }
}