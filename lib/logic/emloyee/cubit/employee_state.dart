// ignore_for_file: public_member_api_docs, sort_constructors_first
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
  final Amount salary;

  const EmployeeState({
    this.firstname = const FirstName.pure(),
    this.lastname = const FirstName.pure(),
    this.phoneNo = const PhoneNo.pure(),
    this.email = const Email.pure(),
    this.currentAddress = const Address.pure(),
    this.premenentAddress = const Address.pure(),
    this.startDate = const MyDate.pure(),
    this.endDate = const MyDate.pure(),
    this.salary = const Amount.pure(),
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
        salary
      ];

  EmployeeState copyWith(
      {FirstName? firstname,
      FirstName? lastname,
      PhoneNo? phoneNo,
      Email? email,
      Address? currentAddress,
      Address? premenentAddress,
      MyDate? startDate,
      MyDate? endDate,
      Amount? salary}) {
    return EmployeeState(
      firstname: firstname ?? this.firstname,
      lastname: lastname ?? this.lastname,
      phoneNo: phoneNo ?? this.phoneNo,
      email: email ?? this.email,
      currentAddress: currentAddress ?? this.currentAddress,
      premenentAddress: premenentAddress ?? this.premenentAddress,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      salary: salary ?? this.salary,
    );
  }
}

final class EmployeeInitial extends EmployeeState {}
