import 'package:flutter_test/flutter_test.dart';
import 'package:kyla_home_budget/src/features/profile/data/user_model.dart';

void main() {
  group('User', () {
    test('copyWith should create a new User object with updated properties',
        () {
      final user = User.fake();
      final updatedUser = user.copyWith(fullName: 'Jane Doe');

      expect(updatedUser.id, equals(user.id));
      expect(updatedUser.fullName, equals('Jane Doe'));
      expect(updatedUser.photoUrl, equals(user.photoUrl));
      expect(updatedUser.cardNo, equals(user.cardNo));
    });

    test('toMap should return a map representation of the User object', () {
      final user = User.fake();
      final userMap = user.toMap();

      expect(userMap['id'], equals(user.id));
      expect(userMap['fullName'], equals(user.fullName));
      expect(userMap['photoUrl'], equals(user.photoUrl));
      expect(userMap['cardNo'], equals(user.cardNo));
    });

    test('fromMap should create a new User object from a map', () {
      final userMap = {
        'id': '1',
        'fullName': 'John Doe',
        'photoUrl': 'https://xsgames.co/randomusers/assets/avatars/male/75.jpg',
        'cardNo': '1234567890123456',
      };
      final user = User.fromMap(userMap);

      expect(user.id, equals(userMap['id']));
      expect(user.fullName, equals(userMap['fullName']));
      expect(user.photoUrl, equals(userMap['photoUrl']));
      expect(user.cardNo, equals(userMap['cardNo']));
    });

    test('fromJson should create a new User object from a JSON string', () {
      const userJson = '''
        {
          "id": "1",
          "fullName": "John Doe",
          "photoUrl": "https://xsgames.co/randomusers/assets/avatars/male/75.jpg",
          "cardNo": "1234567890123456"
        }
      ''';
      final user = User.fromJson(userJson);

      expect(user.id, equals('1'));
      expect(user.fullName, equals('John Doe'));
      expect(user.photoUrl,
          equals('https://xsgames.co/randomusers/assets/avatars/male/75.jpg'));
      expect(user.cardNo, equals('1234567890123456'));
    });

    test('toString should return a string representation of the User object',
        () {
      final user = User.fake();
      final userString = user.toString();

      final expectedString =
          'User(id: ${user.id}, fullName: ${user.fullName}, photoUrl: ${user.photoUrl}, cardNo: ${user.cardNo})';

      expect(userString, equals(expectedString));
    });

    test('operator == should return true if two User objects are equal', () {
      final user1 = User.fake();
      final user2 = User.fake();

      expect(user1 == user2, isTrue);
    });

    test('hashCode should return the hash code of the User object', () {
      final user = User.fake();
      final expectedHashCode = user.id.hashCode ^
          user.fullName.hashCode ^
          user.photoUrl.hashCode ^
          user.cardNo.hashCode;

      expect(user.hashCode, equals(expectedHashCode));
    });
  });
}
