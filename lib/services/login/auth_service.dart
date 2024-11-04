import 'dart:developer';

import '../../ui/common/common.dart';
import '../services.dart';

class AuthService {
  Future<String?> login({
    required String email,
    required String password,
  }) async {
    try {
      final response =
          await DioService.instance.post(ApiEndpoints.login, data: {
        'email': email,
        'password': password,
      });

      log('Response: $response');

      if (response != null && response['access_token'] != null) {
        return response['access_token'];
      } else if (response != null && response['statusCode'] == '404') {
        log('Error: ${response['message']}');
        return null;
      }
    } catch (e) {
      log('Error: $e');
      return null;
    }
    return null;
  }

  Future<bool> register({
    required String email,
    required String password,
    required String firstName,
  }) async {
    final response = await DioService.instance.post(
      ApiEndpoints.register,
      data: {
        'email': email,
        'password': password,
        'firstname': firstName,
      },
    );
    log('Response: $response');

    return response != null;
  }
}
