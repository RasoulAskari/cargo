// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'order_cubit.dart';

class OrderState extends Equatable {
  final FirstName customerName;
  final FirstName customerFathername;
  final FirstName customerGrandFathername;
  final CString customerIdCard;
  final PhoneNo customerPhoneNo;
  final MyDate date;
  final Number groupNum;
  final Amount pricePerKelo;
  final FirstName receiverName;
  final PhoneNo receiverPhoneNo;
  final CString typeReceiver;
  final CString country;
  final CString city;
  final Address address;
  final FormzSubmissionStatus status;
  final ItemsList items;

  const OrderState({
    this.customerName = const FirstName.pure(),
    this.items = const ItemsList.pure(),
    this.customerFathername = const FirstName.pure(),
    this.customerGrandFathername = const FirstName.pure(),
    this.customerIdCard = const CString.pure(),
    this.customerPhoneNo = const PhoneNo.pure(),
    this.date = const MyDate.pure(),
    this.groupNum = const Number.pure(),
    this.pricePerKelo = const Amount.pure(),
    this.receiverName = const FirstName.pure(),
    this.receiverPhoneNo = const PhoneNo.pure(),
    this.typeReceiver = const CString.pure(),
    this.country = const CString.pure(),
    this.city = const CString.pure(),
    this.address = const Address.pure(),
    this.status = FormzSubmissionStatus.initial,
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
        items,
      ];

  OrderState copyWith({
    FirstName? customerName,
    FirstName? customerFathername,
    FirstName? customerGrandFathername,
    CString? customerIdCard,
    PhoneNo? customerPhoneNo,
    MyDate? date,
    Number? groupNum,
    Amount? pricePerKelo,
    FirstName? receiverName,
    PhoneNo? receiverPhoneNo,
    CString? typeReceiver,
    CString? country,
    CString? city,
    Address? address,
    FormzSubmissionStatus? status,
    ItemsList? items,
  }) {
    return OrderState(
      customerName: customerName ?? this.customerName,
      items: items ?? this.items,
      customerFathername: customerFathername ?? this.customerFathername,
      customerGrandFathername:
          customerGrandFathername ?? this.customerGrandFathername,
      customerIdCard: customerIdCard ?? this.customerIdCard,
      customerPhoneNo: customerPhoneNo ?? this.customerPhoneNo,
      date: date ?? this.date,
      groupNum: groupNum ?? this.groupNum,
      pricePerKelo: pricePerKelo ?? this.pricePerKelo,
      receiverName: receiverName ?? this.receiverName,
      receiverPhoneNo: receiverPhoneNo ?? this.receiverPhoneNo,
      typeReceiver: typeReceiver ?? this.typeReceiver,
      country: country ?? this.country,
      city: city ?? this.city,
      address: address ?? this.address,
      status: status ?? this.status,
    );
  }
}

class OrderInitial extends OrderState {}
