import 'package:http/http.dart' as http;

class MalException implements Exception {
  final String message;
  final http.Response response;

  MalException(this.message, this.response);

  @override
  String toString() => 'MalException: $message, response: $response';
}
