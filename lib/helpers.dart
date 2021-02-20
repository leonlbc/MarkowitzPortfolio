
import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:async/async.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:core';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:witz/UI/stock.dart';

final String stocksTable = "stocksTable";
final String idColumn = "idColumn";
final String tickerColumn = "tickerColumn";
final String nameColumn = "nameColumn";
final String priceColumn = "priceColumn";
final String variationColumn = "variationColumn";


class Helper{
  static final Helper _instance = Helper.internal();
  factory Helper() => _instance;
  Helper.internal();

  static Database _db;

    Future<Database> get db async {
      if (_db != null){
        return _db;
      } else {
        _db = await initDb();
        return _db;
      }
    }

    initDb() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "StocksDB.db");
    return await openDatabase(path, version: 1, onOpen: (db){
    }, onCreate: (Database db, int version) async {
      await db.execute("$stocksTable ("
            "$idColumn INTERGER PRIMARY KEY,"
            "$tickerColumn TEXT,"
            "$nameColumn TEXT,"
            "$priceColumn DOUBLE,"
            "$variationColumn DOUBLE"
          ")");
    });
  }



  newStock (Stock newStock) async {
      final database = await db;
      var res = await database.insert("Stock", newStock.toMap());
      return res;
  }

  getStock(int id) async {
      final database = await db;
      var res = await database.query("Stock", where: "id = ?", whereArgs: [id]);
      return res.isNotEmpty ? Stock.fromMap(res.first) : Null;
  }


  Future <List<Stock>> getAllStocks() async {
      final database = await db;
      var res = await database.query("Stock");
      List <Stock> list = res.isNotEmpty ? res.map((c) => Stock.fromMap(c)).toList() : [];
      return list;
  }

  deleteStock(String ticker)async {
    final database = await db;
    database.delete("Stock", where: "id = ?", whereArgs: [idColumn]);
  }

  deleteAll() async {
      final database = await db;
      database.rawDelete("Delete * from Stock");
  }
}

Stock stockFromJson (String str){
  final jsonData = jsonDecode(str);
  return Stock.fromMap(jsonData);
}

String stockToJson(Stock data){
  final dyn = data.toMap();
  return json.encode(dyn);
}


class Stock{

  Stock({
    this.id,
    this.name,
    this.ticker,
    this.price,
    this.variation
});

  int id;
  String ticker;
  String name;
  dynamic price;
  dynamic variation;

  factory Stock.fromMap(Map<String, dynamic> json ) => new Stock(
    id: json["id"],
    ticker: json["ticker"],
    name: json["name"],
    price: json["price"],
    variation: json["variation"]
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "ticker": ticker,
    "name": name,
    "price": price,
    "variation": variation
  };

}

