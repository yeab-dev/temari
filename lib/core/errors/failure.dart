import 'package:equatable/equatable.dart';

class Failure extends Equatable {
  const Failure({
    required this.message,
    required this.statusCode,
  });
  final String message;
  final int statusCode;

  @override
  List<Object?> get props => [message, statusCode];
}
