import 'package:genint/messages/app_content_element_view.dart';

class LoginResponse {
  final bool success;
  final String? message;
  final AppContentElementView? record;

  LoginResponse({required this.success, this.record, required this.message});

  factory LoginResponse.fromMap(Map<String, dynamic> map) {
    final success = map["success"] as bool;
    final message = map["message"] as String?;
    final record = map["record"] as dynamic;

    return LoginResponse(
        success: success,
        message: message,
        record: record == null ? null : AppContentElementView.fromMap(record));
  }
}
