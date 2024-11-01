import 'dart:developer';

import '../../ui/common/common.dart';
import '../services.dart';

class LoginService {
  Future<String?> login({
    required String email,
    required String password,
  }) async {
    final response = await DioService.instance.post(ApiEndpoints.login, data: {
      'email': email,
      'password': password,
    });
    log('Response: $response');
    if (response != null) {
      return response['access_token'];
    }
    return null;
  }
}
