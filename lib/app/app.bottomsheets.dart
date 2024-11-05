// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedBottomsheetGenerator
// **************************************************************************

import 'package:stacked_services/stacked_services.dart';

import 'app.locator.dart';
import '../ui/bottom_sheets/create_user/create_user_sheet.dart';
import '../ui/bottom_sheets/edit_user/edit_user_sheet.dart';

enum BottomSheetType {
  createUser,
  editUser,
}

void setupBottomSheetUi() {
  final bottomsheetService = locator<BottomSheetService>();

  final Map<BottomSheetType, SheetBuilder> builders = {
    BottomSheetType.createUser: (context, request, completer) =>
        const CreateUserSheet(),
    BottomSheetType.editUser: (context, request, completer) =>
        EditUserSheet(request: request, completer: completer),
  };

  bottomsheetService.setCustomSheetBuilders(builders);
}
