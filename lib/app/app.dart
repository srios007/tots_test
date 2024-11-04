import 'package:tots_test/ui/dialogs/info_alert/info_alert_dialog.dart';
import 'package:tots_test/ui/views/home/home_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:tots_test/ui/views/login/login_view.dart';
import 'package:tots_test/services/login/auth_service.dart';
import 'package:tots_test/services/user/user_service.dart';
import 'package:tots_test/ui/bottom_sheets/create_user/create_user_sheet.dart';
import 'package:tots_test/ui/views/register/register_view.dart';
import 'package:tots_test/services/storage/storage_service.dart';
// @stacked-import

@StackedApp(
  routes: [
    MaterialRoute(page: HomeView),
    MaterialRoute(page: LoginView),
    MaterialRoute(page: RegisterView),
// @stacked-route
  ],
  dependencies: [
    LazySingleton(classType: BottomSheetService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: AuthService),
    LazySingleton(classType: UserService),
    LazySingleton(classType: StorageService),
// @stacked-service
  ],
  bottomsheets: [
    StackedBottomsheet(classType: CreateUserSheet),
// @stacked-bottom-sheet
  ],
  dialogs: [
    StackedDialog(classType: InfoAlertDialog),
    // @stacked-dialog
  ],
)
class App {}
