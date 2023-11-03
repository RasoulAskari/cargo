part of 'employee_cubit.dart';

class EmployeeState extends Equatable {
  final FirstName firstname;
  final FirstName lastname;
  final PhoneNo phoneNo;
  final Email email;
  final Address currentAddress;
  final Address premenentAddress;
  final MyDate startDate;
  final MyDate endDate;

  const EmployeeState({
    this.firstname = const FirstName.pure(),
    this.lastname = const FirstName.pure(),
    this.phoneNo = const PhoneNo.pure(),
    this.email = const Email.pure(),
    this.currentAddress = const Address.pure(),
    this.premenentAddress = const Address.pure(),
    this.startDate = const MyDate.pure(),
    this.endDate = const MyDate.pure(),
  });

  @override
  List<Object> get props => [
        firstname,
        lastname,
        phoneNo,
        email,
        currentAddress,
        premenentAddress,
        startDate,
        endDate,
      ];
}

final class EmployeeInitial extends EmployeeState {}
