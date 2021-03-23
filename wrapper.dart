import 'package:firebase_demo/screens/home/home.dart';
import 'package:flutter/material.dart';

import 'package:firebase_demo/screens/autenticate/authenticate.dart';

import 'package:provider/provider.dart';
import 'package:firebase_demo/models/user.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    if (user == null) {
      return Authenticate();
    } else {
      return Home();
    }
  }
}
