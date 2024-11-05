import 'package:flutter/material.dart';
import 'package:tots_test/models/user.dart';

class UserEditService {
  final ValueNotifier<User?> selectedUserNotifier = ValueNotifier<User?>(null);

  void selectUser(User user) {
    selectedUserNotifier.value = user;
  }

  void clearSelectedUser() {
    selectedUserNotifier.value = null;
  }
}