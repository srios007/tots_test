import 'dart:developer';

import 'package:tots_test/models/models.dart';
import 'package:tots_test/services/http/dio_service.dart';

import '../../ui/common/common.dart';

class UserService {
  Future<List<User>> getUsers() async {
    final response = await DioService.instance.get(
      ApiEndpoints.clients,
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
    required String imageUrl,
  }) async {
    final response = await DioService.instance.post(
      ApiEndpoints.clients,
      data: {
        'firstname': firstName,
        'lastname': lastName,
        'email': email,
        'address': address,
        'photo': imageUrl,
        'caption': ''
      },
      requiresAuth: true,
    );

    return response != null;
  }

  Future<bool> deleteUser(String id) async {
    final response = await DioService.instance.delete(
      '${ApiEndpoints.clients}/$id',
      requiresAuth: true,
    );
    log('response: $response');
    return response != null;
  }
}
