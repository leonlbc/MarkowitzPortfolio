import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:async/async.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
/*import 'dart:core';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:witz/UI/stock.dart';

class DBProvider {
  DBProvider._();
  static final DBProvider db = DBProvider._();

  static Database _database;

  Future<Database> get database async {
    if (_database != null)
      return _database;

    // if _database is null we instantiate it
    _database = await initDB();
    return _database;
  }

  initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "TestDB.db");
    return await openDatabase(path, version: 1, onOpen: (db) {
    }, onCreate: (Database db, int version) async {
      await db.execute("CREATE TABLE Client ("
          "id INTEGER PRIMARY KEY,"
          "first_name TEXT,"
          "last_name TEXT,"
          "blocked BIT"
          ")");
    });
  }

  newClient(Client newClient) async {
    final db = await database;
    var res = await db.insert("Client", newClient.toMap());
    return res;
  }

  getClient(int id) async {
    final db = await database;
    var res =await  db.query("Client", where: "id = ?", whereArgs: [id]);
    return res.isNotEmpty ? Client.fromMap(res.first) : Null ;
  }

  getAllClients() async {
    final db = await database;
    var res = await db.query("Client");
    List<Client> list =
    res.isNotEmpty ? res.map((c) => Client.fromMap(c)).toList() : [];
    return list;
  }

  updateClient(Client newClient) async {
    final db = await database;
    var res = await db.update("Client", newClient.toMap(),
        where: "id = ?", whereArgs: [newClient.id]);
    return res;
  }

  deleteClient(int id) async {
    final db = await database;
    db.delete("Client", where: "id = ?", whereArgs: [id]);
  }

  deleteAll() async {
    final db = await database;
    db.rawDelete("Delete * from Client");
  }



}

Client clientFromJson(String str) {
  final jsonData = json.decode(str);
  return Client.fromMap(jsonData);
}

String clientToJson(Client data) {
  final dyn = data.toMap();
  return json.encode(dyn);
}

class Client {
  int id;
  String firstName;
  String lastName;
  bool blocked;

  Client({
    this.id,
    this.firstName,
    this.lastName,
    this.blocked,
  });

  factory Client.fromMap(Map<String, dynamic> json) => new Client(
    id: json["id"],
    firstName: json["first_name"],
    lastName: json["last_name"],
    blocked: json["blocked"] == 1,
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "first_name": firstName,
    "last_name": lastName,
    "blocked": blocked,
  };
}*/