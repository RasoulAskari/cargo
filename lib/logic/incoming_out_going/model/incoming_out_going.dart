import 'package:cargo/logic/login/user_model.dart';
import 'package:equatable/equatable.dart';

class IncomingOutGoing extends Equatable {
  final String name;
  final String type;
  final double amount;
  final UserModel user;

  IncomingOutGoing(this.name, this.type, this.amount, this.user);

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}
