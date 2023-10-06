part of 'order_cubit.dart';

class OrderState extends Equatable {
  final FirstName customerName;
  final FirstName customerFathername;
  final FirstName customerGrandFathername;
  final String customerIdCard;
  final PhoneNo customerPhoneNo;
  final MyDate date;
  final String groupNum;
  final double pricePerKelo;
  final FirstName receiverName;
  final PhoneNo receiverPhoneNo;
  final String typeReceiver;
  final String country;
  final String city;
  final String address;

  OrderState({
    this.customerName = const FirstName.pure(),
    this.customerFathername = const FirstName.pure(),
    this.customerGrandFathername = const FirstName.pure(),
    this.customerIdCard,
    this.customerPhoneNo,
    this.date,
    this.groupNum,
    this.pricePerKelo,
    this.receiverName,
    this.receiverPhoneNo,
    this.typeReceiver,
    this.country,
    this.city,
    this.address,
  });

  @override
  List<Object> get props => [
        customerFathername,
        customerName,
        customerGrandFathername,
        customerIdCard,
        customerPhoneNo,
        date,
        groupNum,
        pricePerKelo,
        receiverName,
        receiverPhoneNo,
        typeReceiver,
        country,
        city,
        address,
      ];
}

class OrderInitial extends OrderState {}
