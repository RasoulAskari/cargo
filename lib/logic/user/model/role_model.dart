// ignore_for_file: public_member_api_docs, sort_constructors_first
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
}
