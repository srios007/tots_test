import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:tots_test/app/app.bottomsheets.dart';
import 'package:tots_test/app/app.dialogs.dart';
import 'package:tots_test/app/app.locator.dart';
import 'package:tots_test/ui/common/app_strings.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../models/models.dart';
import '../../../services/services.dart';

class HomeViewModel extends BaseViewModel implements Initialisable {
  final _dialogService = locator<DialogService>();
  final _bottomSheetService = locator<BottomSheetService>();
  List<User> _users = [];
  List<User> get users => _users;
  bool _isLoading = true;
  bool get isLoading => _isLoading;
  final searchController = TextEditingController();

  @override
  void initialise() {
    getUsers();
  }

  void getUsers() async {
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
    // _bottomSheetService.showCustomSheet(
    //   variant: BottomSheetType.createUser,
    //   title: ksHomeBottomSheetTitle,
    //   description: ksHomeBottomSheetDescription,
    // );
  }
}
