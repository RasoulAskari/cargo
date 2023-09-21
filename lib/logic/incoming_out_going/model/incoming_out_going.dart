import 'package:equatable/equatable.dart';

class IncomingOutGoing extends Equatable {
  final String name;
  final String type;
  final double amount;
  final Map<String, dynamic> createdBy;

  IncomingOutGoing({
    required this.name,
    required this.type,
    required this.amount,
    required this.createdBy,
  });

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}
