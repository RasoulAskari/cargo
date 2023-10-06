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
  final String delivaryType;

  const OrderModel(
      {required this.id,
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
      required this.delivaryType});

  @override
  // TODO: implement props
  List<Object?> get props => [];
}
