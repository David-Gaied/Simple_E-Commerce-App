import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_crud/APIs/api.dart';
import 'package:test_crud/screens/products_list.dart';
import 'package:test_crud/screens/singleusers.dart';
import 'package:test_crud/screens/user_profile.dart';

import 'log_reg/login.dart';

void main() {
  runApp(Home());
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:  Splash(),
    );
  }
}

