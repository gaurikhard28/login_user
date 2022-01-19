import 'dart:async';
import 'package:login_user/models/login_models.dart';

import 'getUserInfo.dart';
import 'package:login_user/models/signup_models.dart';

class Repository{
  final getUserInfo info= getUserInfo();

  Future<User> getAllUsersDetails() =>
      info.fetchUsersDetails();
}