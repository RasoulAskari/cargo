// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:cargo/logic/order/model/my_order_item.dart';
import 'package:equatable/equatable.dart';

class OrderModel extends Equatable {
  final int id;
  final int cardId;
  final String customerName;
  final int groupNumber;
  final String fatherName;
  final String grandFatherName;
  final String tazkiraId;
  final String customerPhone;
  final String receiverName;
  final String receiverPhone;
  final String country;
  final String city;
  final String address;
  final List<MyOrderItme> items;
  final String delivaryType;
  final String date;

  const OrderModel({
    required this.id,
    required this.cardId,
    required this.customerName,
    required this.groupNumber,
    required this.fatherName,
    required this.grandFatherName,
    required this.tazkiraId,
    required this.customerPhone,
    required this.receiverName,
    required this.receiverPhone,
    required this.country,
    required this.city,
    required this.address,
    required this.delivaryType,
    required this.items,
    required this.date,
  });

  @override
  // TODO: implement props
  List<Object> get props {
    return [
      id,
      cardId,
      customerName,
      groupNumber,
      fatherName,
      grandFatherName,
      tazkiraId,
      customerPhone,
      receiverName,
      receiverPhone,
      country,
      city,
      address,
      delivaryType,
      items,
    ];
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'cardId': cardId,
      'customerName': customerName,
      'groupNumber': groupNumber,
      'fatherName': fatherName,
      'grandFatherName': grandFatherName,
      'tazkiraId': tazkiraId,
      'customerPhone': customerPhone,
      'receiverName': receiverName,
      'receiverPhone': receiverPhone,
      'country': country,
      'city': city,
      'address': address,
      'delivaryType': delivaryType,
    };
  }

  factory OrderModel.fromMap(Map<String, dynamic> map) {
    final orderItems =
        map['items'] == null ? [] : map['items'] as List<MyOrderItme>;
    return OrderModel(
      items: orderItems
          .map((e) => MyOrderItme(
              name: e.name, type: e.type, count: e.count, weight: e.weight))
          .toList(),
      id: map['id'] as int,
      cardId: map['car_id'] as int,
      customerName: map['customer_name'] as String,
      date: map['date'] as String,
      groupNumber: map['group_number'] as int,
      fatherName: map['father_name'] as String,
      grandFatherName: map['grand_father_name'] as String,
      tazkiraId: map['tazkira_id'] as String,
      customerPhone: map['customer_phone'] as String,
      receiverName: map['receiver_name'] as String,
      receiverPhone: map['receiver_phone'] as String,
      country: map['country'] as String,
      city: map['city'] as String,
      address: map['address'] as String,
      delivaryType: map['delivary_type'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory OrderModel.fromJson(String source) =>
      OrderModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
