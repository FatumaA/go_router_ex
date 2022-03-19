import 'package:flutter/material.dart';

import 'user.model.dart';

class LoginInfo extends ChangeNotifier {
  List<User> _users = [];
  List<User>  get users => _users;
  bool get loggedIn => _users.isNotEmpty;

  login(User user) {
    _users = [user];
    notifyListeners();
  }

  void logout() {
    _users = [];
    notifyListeners();
  }
}
