import 'package:equatable/equatable.dart';

class RoleModel extends Equatable {
  final String systemId;
  final String systemName;
  final List<String> action;
  final List<String> allowRole;

  const RoleModel(
      {required this.systemId,
      required this.systemName,
      required this.action,
      required this.allowRole});

  @override
  List<Object?> get props => throw UnimplementedError();
}
