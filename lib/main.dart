import 'package:flutter/material.dart';
import 'package:witz/UI/Navigation.dart';
import 'package:witz/UI/NewPort.dart';
import 'package:http/http.dart' as http;
import 'UI/HomePage.dart';
import 'dart:convert';

void main(){
  runApp(MaterialApp(
    home: Navigation(),
    debugShowCheckedModeBanner: false,
  ));
}