import 'package:flutter_test/flutter_test.dart';
import 'package:tots_test/app/app.locator.dart';

import '../helpers/test_helpers.dart';

void main() {
  group('EditUserSheetModel Tests -', () {
    setUp(() => registerServices());
    tearDown(() => locator.reset());
  });
}
