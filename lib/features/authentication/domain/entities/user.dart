import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String id;
  final String email;
  final String? fullName;
  final String? username;
  final String? profilePictureUrl;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  const User({
    required this.id,
    required this.email,
    this.fullName,
    this.username,
    this.profilePictureUrl,
    this.createdAt,
    this.updatedAt,
  });

  @override
  List<Object?> get props =>
      [id, email, fullName, profilePictureUrl, createdAt, updatedAt];
}
