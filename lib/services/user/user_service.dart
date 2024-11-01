import 'package:tots_test/models/models.dart';
import 'package:tots_test/services/http/dio_service.dart';

import '../../ui/common/common.dart';


class UserService {
  Future<List<User>> getUsers() async {
    final response = await DioService.instance.get(
      ApiEndpoints.users,
      requiresAuth: true,
    );
    if (response.data != null) {
      final users = response.data['data'] as List;
      return users.map((e) => User.fromJson(e as Map<String, dynamic>)).toList();
    }
    return [];
  }
}
