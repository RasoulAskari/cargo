// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class RoleModel extends Equatable {
  final String systemId;
  final String systemName;
  final List<String> action;
  final List<String> allowRole;

  const RoleModel({
    required this.systemId,
    required this.systemName,
    required this.action,
    required this.allowRole,
  });

  @override
  List<Object?> get props => throw UnimplementedError();

  RoleModel copyWith({
    String? systemId,
    String? systemName,
    List<String>? action,
    List<String>? allowRole,
  }) {
    return RoleModel(
      systemId: systemId ?? this.systemId,
      systemName: systemName ?? this.systemName,
      action: action ?? this.action,
      allowRole: allowRole ?? this.allowRole,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'systemId': systemId,
      'systemName': systemName,
      'action': action,
      'allowRole': allowRole,
    };
  }

  factory RoleModel.fromMap(Map<String, dynamic> map) {
    return RoleModel(
      systemId: map['systemId'] as String,
      systemName: map['systemName'] as String,
      action: List<String>.from((map['action'] as List<String>)),
      allowRole: List<String>.from((map['allowRole'] as List<String>)),
    );
  }

  String toJson() => json.encode(toMap());

  factory RoleModel.fromJson(String source) =>
      RoleModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
