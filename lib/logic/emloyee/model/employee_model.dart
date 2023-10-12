// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class EmployeeModel extends Equatable {
  final int id;
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
  final double salary;
  const EmployeeModel({
    required this.id,
    required this.currentAddress,
    required this.permenentAddress,
    required this.startDate,
    required this.endDate,
    required this.jobTitle,
    required this.salary,
    required this.firstName,
    required this.lastName,
    required this.profile,
    required this.email,
    required this.phoneNumber,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'firstName': firstName,
      'lastName': lastName,
      'profile': profile,
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
      salary: double.parse(map['salary'].toString()),
      id: map['id'] as int,
      firstName: map['first_name'] as String,
      lastName: map['last_name'] as String,
      profile: map['profile'] as String,
      email: map['email'] as String,
      phoneNumber: map['phone_number'] as String,
      currentAddress: map['current_address'] as String,
      permenentAddress: map['permenent_address'] as String,
      startDate: map['employment_start_date'] as String,
      endDate: map['employment_start_date'] as String,
      jobTitle: map['job_title'] as String,
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
      id: id ?? this.id,
      salary: salary ?? this.salary,
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
    );
  }

  List<Object?> get props => [
        id,
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
        salary,
      ];
}
