import 'package:flutter_riverpod/misc.dart';

class AppException implements Exception {
  const AppException(this.message, {this.code});

  final String message;
  final String? code;

  @override
  String toString() {
    // TODO: implement toString
    return message;
  }
}
