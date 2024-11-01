class ApiEndpoints {
  factory ApiEndpoints() {
    return _instance;
  }

  ApiEndpoints._internal();

  static final _instance = ApiEndpoints._internal();

  static const String login = '/oauth/token';
  static const String users = '/clients';
}
