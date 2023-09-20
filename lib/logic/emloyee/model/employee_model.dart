// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class EmployeeModel extends Equatable {
  // final int id;
  final String firstName;
  final String lastName;
  // final String profile;
  final String email;
  final String phoneNumber;
  final String currentAddress;
  final String permenentAddress;
  final String startDate;
  final String endDate;
  final String jobTitle;
  // final double salary;
  EmployeeModel({
    // required this.id,
    required this.currentAddress,
    required this.permenentAddress,
    required this.startDate,
    required this.endDate,
    required this.jobTitle,
    // required this.salary,
    required this.firstName,
    required this.lastName,
    // required this.profile,
    required this.email,
    required this.phoneNumber,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'firstName': firstName,
      'lastName': lastName,
      // 'profile': profile,
      'email': email,
      'phoneNumber': phoneNumber,
      'currentAddress': currentAddress,
      'permenentAddress': permenentAddress,
      'startDate': startDate,
      'endDate': endDate,
      'jobTitle': jobTitle,
    };
  }

  factory EmployeeModel.fromMap(Map<String, dynamic> map) {
    return EmployeeModel(
      firstName: map['firstName'] as String,
      lastName: map['lastName'] as String,
      // profile: map['profile'] as String,
      email: map['email'] as String,
      phoneNumber: map['phoneNumber'] as String,
      currentAddress: map['currentAddress'] as String,
      permenentAddress: map['permenentAddress'] as String,
      startDate: map['startDate'] as String,
      endDate: map['endDate'] as String,
      jobTitle: map['jobTitle'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory EmployeeModel.fromJson(String source) =>
      EmployeeModel.fromMap(json.decode(source) as Map<String, dynamic>);

  EmployeeModel copyWith({
    int? id,
    String? firstName,
    String? lastName,
    String? profile,
    String? email,
    String? phoneNumber,
    String? currentAddress,
    String? permenentAddress,
    String? startDate,
    String? endDate,
    String? jobTitle,
    double? salary,
  }) {
    return EmployeeModel(
      // id: id ?? this.id,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      // profile: profile ?? "this.profile",
      email: email ?? this.email,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      currentAddress: currentAddress ?? this.currentAddress,
      permenentAddress: permenentAddress ?? this.permenentAddress,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      jobTitle: jobTitle ?? this.jobTitle,
      // salary: salary ?? this.salary,
    );
  }

  List<Object?> get props => [
        // id,
        firstName,
        lastName,
        // profile,
        email,
        phoneNumber,
        currentAddress,
        permenentAddress,
        startDate,
        endDate,
        jobTitle,
        // salary,
      ];
}
