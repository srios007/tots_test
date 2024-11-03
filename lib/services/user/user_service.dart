import 'dart:developer';

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
      return users
          .map((e) => User.fromJson(e as Map<String, dynamic>))
          .toList();
    }
    return [];
  }

  Future<bool> createUser({
    required String firstName,
    required String lastName,
    required String email,
    required String address,
  }) async {
    final response = await DioService.instance.post(
      ApiEndpoints.users,
      data: {
        'firstname': firstName,
        'lastname': lastName,
        'email': email,
        'address': address,
        'photo': '',
        'caption': ''
      },
      requiresAuth: true,
    );
    return response != null;
  }

  Future<bool> deleteUser(String id) async {
    final response = await DioService.instance.delete(
      '${ApiEndpoints.users}/$id',
      requiresAuth: true,
    );
    log('response: $response');
    return response != null;
  }
}
