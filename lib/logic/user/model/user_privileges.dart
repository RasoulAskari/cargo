// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class UserPrivileage extends Equatable {
  final List<String> allowRole;

  const UserPrivileage({
    required this.allowRole,
  });

  UserPrivileage copyWith({
    List<String>? allowRole,
  }) {
    return UserPrivileage(
      allowRole: allowRole ?? this.allowRole,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'allowRole': allowRole,
    };
  }

  factory UserPrivileage.fromMap(Map<String, dynamic> map) {
    return UserPrivileage(
      allowRole: List<String>.from((map['allow_role'] as List<String>)),
    );
  }

  String toJson() => json.encode(toMap());

  factory UserPrivileage.fromJson(String source) =>
      UserPrivileage.fromMap(json.decode(source) as Map<String, dynamic>);
  @override
  List<Object?> get props => [
        allowRole,
      ];
}
