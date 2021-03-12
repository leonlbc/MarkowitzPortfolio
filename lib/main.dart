import 'package:flutter/material.dart';
import 'package:witz/UI/Navigation.dart';
import 'package:witz/controllers/DatabaseController.dart';
import 'package:witz/models/model.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  final dbController = DatabaseController();
  final bool dbInitialized = await DbModel().initializeDB();

  if (dbInitialized) {
    dbController.sample();
    runApp(MaterialApp(
      home: Navigation(dropdownInitValue: 1),
      debugShowCheckedModeBanner: false,
    ));
  }
}
