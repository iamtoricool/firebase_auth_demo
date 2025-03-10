import 'package:equatable/equatable.dart';

import 'package:faker/faker.dart' as f;

class UserModel extends Equatable {
  final int id;
  final String fullName;
  final String emailAddress;
  final String? imageUrl;
  final DateTime? lastLoggedIn;

  const UserModel({
    required this.id,
    required this.fullName,
    required this.emailAddress,
    this.imageUrl,
    this.lastLoggedIn,
  });

  UserModel copyWith({
    String? fullName,
    String? emailAddress,
    String? imageUrl,
    DateTime? lastLoggedIn,
  }) {
    return UserModel(
      id: id,
      fullName: fullName ?? this.fullName,
      emailAddress: emailAddress ?? this.emailAddress,
      imageUrl: imageUrl ?? this.emailAddress,
      lastLoggedIn: lastLoggedIn ?? this.lastLoggedIn,
    );
  }

  factory UserModel.mock([int? randomness]) {
    return UserModel(
      id: f.faker.randomGenerator.integer(100),
      fullName: f.faker.person.name(),
      emailAddress: f.faker.internet.email(),
      imageUrl: f.faker.image.loremPicsum(random: 1),
      lastLoggedIn: f.faker.date.dateTime(),
    );
  }

  @override
  List<Object?> get props => [id, emailAddress];
}
