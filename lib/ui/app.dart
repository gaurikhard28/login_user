import 'package:flutter/material.dart';

import 'login_page.dart';

class app extends StatefulWidget {
  const app({Key? key}) : super(key: key);

  @override
  _appState createState() => _appState();
}

class _appState extends State<app> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: login_page(),
    );
  }
}
