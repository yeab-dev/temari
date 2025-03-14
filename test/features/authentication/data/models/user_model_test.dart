import 'package:flutter_test/flutter_test.dart';
import 'package:temari/features/authentication/data/models/user_model.dart';

void main() {
  final userModel = UserModel(
    id: '1',
    email: 'test@example.com',
    fullName: 'Test User',
    username: 'testuser',
    profilePictureUrl: 'http://example.com/profile.jpg',
    createdAt: DateTime(2022, 1, 1),
    updatedAt: DateTime(2022, 1, 2),
  );

  group('UserModel', () {
    test('fromJson should return a valid model', () {
      const jsonString =
          '{"id":"1","email":"test@example.com","fullName":"Test User","username":"testuser","profilePictureUrl":"http://example.com/profile.jpg","createdAt":"2022-01-01T00:00:00.000","updatedAt":"2022-01-02T00:00:00.000"}';
      final result = UserModel.fromJson(jsonString);
      expect(result, userModel);
    });

    test('toJson should return a valid JSON string', () {
      const jsonString =
          '{"id":"1","email":"test@example.com","fullName":"Test User","username":"testuser","profilePictureUrl":"http://example.com/profile.jpg","createdAt":"2022-01-01T00:00:00.000","updatedAt":"2022-01-02T00:00:00.000"}';
      final result = userModel.toJson();
      expect(result, jsonString);
    });

    test('fromMap should return a valid model', () {
      final map = {
        'id': '1',
        'email': 'test@example.com',
        'fullName': 'Test User',
        'username': 'testuser',
        'profilePictureUrl': 'http://example.com/profile.jpg',
        'createdAt': '2022-01-01T00:00:00.000',
        'updatedAt': '2022-01-02T00:00:00.000',
      };
      final result = UserModel.fromMap(map);
      expect(result, userModel);
    });

    test('toMap should return a valid map', () {
      final map = {
        'id': '1',
        'email': 'test@example.com',
        'fullName': 'Test User',
        'username': 'testuser',
        'profilePictureUrl': 'http://example.com/profile.jpg',
        'createdAt': '2022-01-01T00:00:00.000',
        'updatedAt': '2022-01-02T00:00:00.000',
      };
      final result = userModel.toMap();
      expect(result, map);
    });

    test('copyWith should return a new model with updated values', () {
      final updatedModel = userModel.copyWith(email: 'new@example.com');
      expect(updatedModel.email, 'new@example.com');
      expect(updatedModel.id, userModel.id); // unchanged
    });
  });
}
