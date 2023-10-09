import 'package:equatable/equatable.dart';

class OrderItem extends Equatable {
  final String name;
  final String type;
  final int count;
  final double weight;

  OrderItem(
      {required this.name,
      required this.type,
      required this.count,
      required this.weight});

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}
