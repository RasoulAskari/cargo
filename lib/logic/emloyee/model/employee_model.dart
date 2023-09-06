// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class EmployeeModel extends Equatable {
  final String firstName;
  final String lastLame;
  final String profile;
  final String email;
  final String phoneNumber;
  final String currentAddress;
  final String permenentAddress;
  final String startDate;
  final String endDate;
  final String jobTitle;
  final double salary;
  EmployeeModel({
    required this.currentAddress,
    required this.permenentAddress,
    required this.startDate,
    required this.endDate,
    required this.jobTitle,
    required this.salary,
    required this.firstName,
    required this.lastLame,
    required this.profile,
    required this.email,
    required this.phoneNumber,
  });

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'firstName': firstName,
      'lastLame': lastLame,
      'profile': profile,
      'email': email,
      'phoneNumber': phoneNumber,
      'currentAddress': currentAddress,
      'permenentAddress': permenentAddress,
      'startDate': startDate,
      'endDate': endDate,
      'jobTitle': jobTitle,
      'salary': salary,
    };
  }

  //  $table->id();
  //   $table->string('first_name');
  //   $table->string('last_name');
  //   $table->string('profile')->nullable();
  //   $table->string('email')->nullable();
  //   $table->string('phone_number');
  //   $table->string('current_address')->nullable();
  //   $table->string('permenent_address')->nullable();
  //   $table->date('employment_start_date');
  //   $table->date('employment_end_date')->nullable();
  //   $table->string('job_title');
  //   $table->float('salary')->default(0);
  //   $table->string('employee_id_number')->nullable();
  //   $table->softDeletes();
  //   $table->timestamps();
     

  factory EmployeeModel.fromMap(Map<String, dynamic> map) {
    return EmployeeModel(
      firstName: map['first'] as String,
      lastLame: map['lastLame'] as String,
      profile: map['profile'] as String,
      email: map['email'] as String,
      phoneNumber: map['phoneNumber'] as String,
      currentAddress: map['currentAddress'] as String,
      permenentAddress: map['permenentAddress'] as String,
      startDate: map['startDate'] as String,
      endDate: map['endDate'] as String,
      jobTitle: map['jobTitle'] as String,
      salary: map['salary'] as double,
    );
  }

  String toJson() => json.encode(toMap());

  factory EmployeeModel.fromJson(String source) => EmployeeModel.fromMap(json.decode(source) as Map<String, dynamic>);
}

