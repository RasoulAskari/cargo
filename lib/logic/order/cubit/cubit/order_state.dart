part of 'order_cubit.dart';

 class OrderState extends Equatable {
  final FirstName customerName;
  final FirstName customerFathername;
  final FirstName customerGrandFathername;
  final CString customerIdCard;
  final PhoneNo customerPhoneNo;
  final MyDate date;
  final Amount groupNum;
  final Amount pricePerKelo;
  final FirstName receiverName;
  final PhoneNo receiverPhoneNo;
  final CString typeReceiver;
  final CString country;
  final CString city;
  final CString address;

  const OrderState({
    this.customerName = const FirstName.pure(),
    this.customerFathername = const FirstName.pure(),
    this.customerGrandFathername = const FirstName.pure(),
    this.customerIdCard = const CString.pure(),
    this.customerPhoneNo = const PhoneNo.pure(),
    this.date = const MyDate.pure(),
    this.groupNum = const Amount.pure(),
    this.pricePerKelo = const Amount.pure(),
    this.receiverName = const FirstName.pure(),
    this.receiverPhoneNo = const PhoneNo.pure(),
    this.typeReceiver = const CString.pure(),
    this.country = const CString.pure(),
    this.city = const CString.pure(),
    this.address = const CString.pure(),
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
