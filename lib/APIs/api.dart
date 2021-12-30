import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:developer';

var body;

class API {
  Future getAllUsers() async {
    var url = Uri.parse('https://fakestoreapi.com/products');
    var response = await http.get(url);
    body = jsonDecode(response.body);
    //print(response.statusCode);
   // print(jsonDecode(response.body));
    return jsonDecode(response.body);
  }
  Future sowAllUsers(int id ) async {
    var url = Uri.parse("https://fakestoreapi.com/products/$id");
    var response = await http.get(url);
    body = jsonDecode(response.body);
    print(response.statusCode);
    print(jsonDecode(response.body));
    return jsonDecode(response.body);
  }
}

