import 'dart:convert';

import 'package:training_application/models/user.dart';

import 'package:flutter/services.dart';

class UserService {
  static Future<dynamic> _processData() async {
    final String jsonData =
      await rootBundle.loadString('assets/mocks/users_mock.json');
    return json.decode(jsonData);
  }

  static Future<List<User>> getUsers() async {
    final data = await _processData();
    final List<User> users = [];
    data.forEach((userData) => users.add(User.listConstructor(userData)));
    return users;
  }

  static Future<User> getUser(int id) async {
    assert(id != null, 'Id should not be null!');
    final data = await _processData();
    final userData = data.firstWhere((userData)
      => userData['id'] == id);
    var user;
    if (userData != null) user = User.listConstructor(userData);
    return user;
  }
}
