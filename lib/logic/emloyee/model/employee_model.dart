// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class EmployeeModel extends Equatable {
  // final int id;
  final String firstName;
  final String lastName;
  final String profile;
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
    required this.profile,
    required this.email,
    required this.phoneNumber,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      // 'id': id,
      'first_name': firstName,
      'last_name': lastName,
      'profile': profile,
      'email': email,
      'phone_number': phoneNumber,
      'current_address': currentAddress,
      'permenent_address': permenentAddress,
      'employment_start_date': startDate,
      'employment_end_date': endDate,
      'job_title': jobTitle,
      // 'salary': salary,
    };
  }

  factory EmployeeModel.fromMap(Map<String, dynamic> map) {
    return EmployeeModel(
      firstName: map['first_name'] as String,
      // id: int.parse(map['id']),
      lastName: map['last_name'] as String,
      profile: map['profile'] as String,
      email: map['email'] as String,
      phoneNumber: map['phone_number'] as String,
      currentAddress: map['current_address'] as String,
      permenentAddress: map['permenent_address'] as String,
      startDate: map['employment_start_date'] as String,
      endDate: map['employment_end_date'] as String,
      jobTitle: map['job_title'] as String,
      // salary: double.parse(map['salary']),
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
      profile: profile ?? this.profile,
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
        profile,
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
