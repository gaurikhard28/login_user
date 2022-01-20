import 'dart:async';
import 'package:login_user/models/login_models.dart';

import 'getUserInfo.dart';
import 'package:login_user/models/signup_models.dart';

class Repository{
  final getUserInfo info= getUserInfo();

  Future<void> login() async {
    print('attempting login');
    await Future.delayed(Duration(seconds: 3));
    print("login In");
  }

}