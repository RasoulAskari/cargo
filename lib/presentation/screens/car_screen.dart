import 'package:cargo/config/localization.dart';
import 'package:cargo/logic/car/bloc/car_bloc.dart';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_bloc/flutter_bloc.dart';

class CarScreen extends StatelessWidget {
  const CarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            )),
        backgroundColor: Theme.of(context).primaryColor,
        title: Text(
          AppLocalizations.of(context)!.car_screen,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: BlocBuilder<CarBloc, CarState>(
        builder: (context, state) {
          if (state.status == CarStatus.initial) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return Container(
            child: Text("state.cars.toString()"),
          );
        },
      ),
    );
  }
}
