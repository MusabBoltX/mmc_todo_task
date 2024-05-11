class NoDataFoundException implements Exception {
  final String message;

  NoDataFoundException([this.message = 'No data found.']);

  @override
  String toString() {
    return 'NoDataFoundException: $message';
  }
}

class MyUnAuthorizedException implements Exception {
  final String message;

  MyUnAuthorizedException([this.message = 'UnAuthenticated']);

  @override
  String toString() {
    return 'UnAuthenticated: $message';
  }
}
