import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:tots_test/app/app.dialogs.dart';
import 'package:tots_test/app/app.locator.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:tots_test/ui/views/home/services/user_edit_service.dart';
import 'package:tots_test/utils/utils.dart';

import '../../../app/app.bottomsheets.dart';
import '../../../app/app.router.dart';
import '../../../models/models.dart';
import '../../../services/services.dart';
import '../../ui.dart';

class HomeViewModel extends BaseViewModel implements Initialisable {
  bool _isLoading = false;
  bool get hasMoreUsers => _currentCount < _filteredUsers.length;
  bool get isEmpty => _filteredUsers.isEmpty;
  bool get isLoading => _isLoading;
  final _bottomSheetService = locator<BottomSheetService>();
  final _dialogService = locator<DialogService>();
  final _navigationService = locator<NavigationService>();
  final _userEditService = locator<UserEditService>();
  final int _itemsPerPage = 5;
  final searchController = TextEditingController();
  final ValueNotifier<User?> selectedUserNotifier = ValueNotifier<User?>(null);
  int _currentCount = 0;
  List<User> _displayedUsers = [];
  List<User> _filteredUsers = [];
  List<User> _users = [];
  List<User> get users => _displayedUsers;
  Timer? _debounce;

  @override
  void initialise() {
    getUsers();
    listenToEvent();
  }

  @override
  void dispose() {
    searchController.dispose();
    _debounce?.cancel();
    super.dispose();
  }

  /// Called when the search query changes.
  onSearchChanged(String query) {
    if (_debounce?.isActive ?? false) {
      _debounce?.cancel();
    }
    _debounce = Timer(const Duration(milliseconds: 500), () {
      onSearchUser(query);
    });
  }

  /// Listens to events from the EventBus.
  void listenToEvent() {
    EventBus()
        .stream
        .where((event) => event is MyEvent && event.message == 'new_user')
        .listen((event) {
      searchController.clear();
      getUsers();
    });
  }

  /// Fetches users from the UserService.
  void getUsers() async {
    _isLoading = true;
    rebuildUi();
    _users = await UserService().getUsers();
    _filteredUsers = _users;
    _currentCount = 0;
    _displayedUsers = [];
    loadMoreUsers();
    _isLoading = false;
    rebuildUi();
  }

  /// Shows a custom dialog.
  void showDialog() {
    _dialogService.showCustomDialog(
      variant: DialogType.infoAlert,
      title: 'Stacked Rocks!',
      description: 'Give stacked stars on Github',
    );
  }

  /// Shows the bottom sheet to create a new user.
  void showBottomSheetCreateUser() {
    _bottomSheetService.showCustomSheet(
      isScrollControlled: true,
      variant: BottomSheetType.createUser,
    );
  }

  /// Shows the bottom sheet to edit an existing user.
  void showBottomSheetEditUser(User user) {
    Get.back();
    _userEditService.selectUser(user);
    _bottomSheetService.showCustomSheet(
      isScrollControlled: true,
      variant: BottomSheetType.editUser,
    );
  }

  /// Filters users based on the search query.
  void onSearchUser(String query) {
    if (query.isEmpty) {
      _filteredUsers = _users;
    } else {
      _filteredUsers = _users
          .where((user) =>
              user.firstname!.toLowerCase().contains(query.toLowerCase()) ||
              user.lastname!.toLowerCase().contains(query.toLowerCase()) ||
              user.email!.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }
    _currentCount = 0;
    _displayedUsers = [];
    loadMoreUsers();
    rebuildUi();
  }

  /// Deletes a user by ID.
  void deleteUser(String id) async {
    final isDeleted = await UserService().deleteUser(id);
    if (isDeleted) {
      Get.back();
      CustomSnackBars.showSuccessSnackBar(
        message: 'User deleted successfully',
      );
      deleteUserLocally(id);
    } else {
      CustomSnackBars.showErrorSnackBar(
        message: 'There was an unexpected error',
      );
    }
  }

  /// Deletes a user locally by ID.
  void deleteUserLocally(String id) {
    _users.removeWhere((user) => user.id.toString() == id);
    _filteredUsers.removeWhere((user) => user.id.toString() == id);
    _displayedUsers.removeWhere((user) => user.id.toString() == id);
    rebuildUi();
  }

  /// Loads more users into the displayed list.
  void loadMoreUsers() {
    final nextCount = _currentCount + _itemsPerPage;
    if (nextCount <= _filteredUsers.length) {
      _displayedUsers.addAll(_filteredUsers.getRange(_currentCount, nextCount));
      _currentCount = nextCount;
    } else if (_currentCount < _filteredUsers.length) {
      _displayedUsers.addAll(
          _filteredUsers.getRange(_currentCount, _filteredUsers.length));
      _currentCount = _filteredUsers.length;
    }
    rebuildUi();
  }

  /// Logs out the user by removing the token and navigating to the login view.
  void logout() {
    GetStorage().remove('token');
    _navigationService.replaceWith(Routes.loginView);
    CustomSnackBars.showSuccessSnackBar(
      message: 'You have been logged out',
    );
  }
}
