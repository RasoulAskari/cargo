// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class OrderItem extends Equatable {
  final String name;
  final String type;
  final int count;
  final double weight;

  const OrderItem(
      {required this.name,
      required this.type,
      required this.count,
      required this.weight});

  @override
  // TODO: implement props
  List<Object?> get props => [name, type, count, weight];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'type': type,
      'count': count,
      'weight': weight,
    };
  }

  factory OrderItem.fromMap(Map<String, dynamic> map) {
    return OrderItem(
      name: map['name'] as String,
      type: map['type'] as String,
      count: map['count'] as int,
      weight: map['weight'] as double,
    );
  }

  String toJson() => json.encode(toMap());

  factory OrderItem.fromJson(String source) =>
      OrderItem.fromMap(json.decode(source) as Map<String, dynamic>);

  OrderItem copyWith({
    String? name,
    String? type,
    int? count,
    double? weight,
  }) {
    return OrderItem(
      name: name ?? this.name,
      type: type ?? this.type,
      count: count ?? this.count,
      weight: weight ?? this.weight,
    );
  }
}
