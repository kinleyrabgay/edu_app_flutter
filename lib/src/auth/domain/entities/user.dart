// ignore_for_file: public_member_api_docs, sort_constructors_first, lines_longer_than_80_chars
// Going through UI user will have email, name...

import 'package:equatable/equatable.dart';

class LocalUser extends Equatable {
  const LocalUser({
    required this.uid,
    required this.email,
    required this.points,
    required this.fullName,
    this.groupIds = const [],
    this.enrolledCourseIds = const [],
    this.following = const [],
    this.followers = const [],
    this.profilePic,
    this.bio,
  });

  const LocalUser.empty()
      : this(
          uid: '',
          email: '',
          points: 0,
          fullName: '',
          profilePic: '',
          bio: '',
          groupIds: const [],
          enrolledCourseIds: const [],
          followers: const [],
          following: const [],
        );

  final String uid;
  final String email;
  final String? profilePic;
  final String? bio;
  final int points;
  final String fullName;
  final List<String> groupIds;
  final List<String> enrolledCourseIds;
  final List<String> following;
  final List<String> followers;

  // EQUATE TWO USER (HOW TO KNOW WHEN TWO USERS ARE EQUAL?)
  @override
  List<Object?> get props => [uid, email];

  @override
  String toString() {
    return 'LocalUser{uid: $uid, email: $email, bio: $bio, points: $points, fullName: $fullName }';
  }

  // Empty version for test
}
