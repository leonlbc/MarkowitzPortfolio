import 'package:flutter/material.dart';
import 'package:witz/UI/Initial%20Page.dart';
import 'package:witz/UI/NewPort.dart';
import 'package:http/http.dart' as http;
import 'package:witz/UI/TESTE.dart';
import 'UI/HomePage.dart';
import 'dart:convert';

void main(){

  runApp(MaterialApp(
    home: TestPage(),
    debugShowCheckedModeBanner: false,
  ));
}