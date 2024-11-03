import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:tots_test/app/app.dialogs.dart';
import 'package:tots_test/app/app.locator.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:tots_test/utils/utils.dart';

import '../../../app/app.bottomsheets.dart';
import '../../../models/models.dart';
import '../../../services/services.dart';

class HomeViewModel extends BaseViewModel implements Initialisable {
  final _dialogService = locator<DialogService>();
  final _bottomSheetService = locator<BottomSheetService>();
  List<User> _users = [];
  List<User> get users => _users;
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  final searchController = TextEditingController();

  @override
  void initialise() {
    getUsers();
    listenToEvent();
  }

  void listenToEvent() {
    EventBus()
        .stream
        .where((event) => event is MyEvent && event.message == 'new_user')
        .listen((event) {
      getUsers();
    });
  }

  void getUsers() async {
    _isLoading = true;
    rebuildUi();
    _users = await UserService().getUsers();
    log('Largo de usuarios: ${_users.length}');
    _isLoading = false;
    rebuildUi();
  }

  void showDialog() {
    _dialogService.showCustomDialog(
      variant: DialogType.infoAlert,
      title: 'Stacked Rocks!',
      description: 'Give stacked stars on Github',
    );
  }

  void showBottomSheetCreateUser() {
    _bottomSheetService.showCustomSheet(
      isScrollControlled: true,
      variant: BottomSheetType.createUser,
    );
  }
}
