// ignore_for_file: public_member_api_docs, sort_constructors_first
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
    required this.firstName,
    required this.lastLame,
    required this.profile,
    required this.email,
    required this.phoneNumber,
  });

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
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
     