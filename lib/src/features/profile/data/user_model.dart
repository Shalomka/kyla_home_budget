// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class User {
  final String id;
  final String fullName;
  final String? photoUrl;
  final String cardNo;
  User({
    required this.id,
    required this.fullName,
    this.photoUrl,
    required this.cardNo,
  });

  // fake user
  factory User.fake() {
    return User(
      id: '1',
      fullName: 'John Doe',
      photoUrl: 'https://xsgames.co/randomusers/assets/avatars/male/75.jpg',
      cardNo: '1234567890123456',
    );
  }

  User copyWith({
    String? id,
    String? fullName,
    String? photoUrl,
    String? cardNo,
  }) {
    return User(
      id: id ?? this.id,
      fullName: fullName ?? this.fullName,
      photoUrl: photoUrl ?? this.photoUrl,
      cardNo: cardNo ?? this.cardNo,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'fullName': fullName,
      'photoUrl': photoUrl,
      'cardNo': cardNo,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'] as String,
      fullName: map['fullName'] as String,
      photoUrl: map['photoUrl'] != null ? map['photoUrl'] as String : null,
      cardNo: map['cardNo'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) =>
      User.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'User(id: $id, fullName: $fullName, photoUrl: $photoUrl, cardNo: $cardNo)';
  }

  @override
  bool operator ==(covariant User other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.fullName == fullName &&
        other.photoUrl == photoUrl &&
        other.cardNo == cardNo;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        fullName.hashCode ^
        photoUrl.hashCode ^
        cardNo.hashCode;
  }
}
