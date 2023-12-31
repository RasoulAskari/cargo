import 'package:cargo/config/localization.dart';
import 'package:cargo/constants/routes.dart';
import 'package:cargo/logic/helpers/global_helpers.dart';
import 'package:cargo/logic/incoming_out_going/bloc/bloc/incoming_out_going_bloc.dart';
import 'package:cargo/presentation/widgets/incoming_out_going_item.dart';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_bloc/flutter_bloc.dart';

class IncomingOutGoingScreen extends StatefulWidget {
  const IncomingOutGoingScreen({super.key});

  @override
  State<IncomingOutGoingScreen> createState() => _IncomingOutGoingScreenState();
}

class _IncomingOutGoingScreenState extends State<IncomingOutGoingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        actions: [
          IconButton(
              onPressed: () {
                checkPermissionRoute(
                    addIncomingOutGoing, 'income_create', context);
              },
              icon: const Icon(
                Icons.add,
                color: Colors.white,
                size: 30,
              ))
        ],
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            )),
        title: Text(
          AppLocalizations.of(context)!.incoming_outgoing_screen,
          style: const TextStyle(
              color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
      body: BlocBuilder<IncomingOutGoingBloc, IncomingOutGoingState>(
        builder: (context, state) {
          if (state.status == IncomingOutGoingStatus.initial) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          return ListView.builder(
            itemCount: state.incoming_out_going.length,
            itemBuilder: (context, index) {
              return IncomingOutGoingItem(
                item: state.incoming_out_going[index],
              );
            },
          );
        },
      ),
    );
  }
}
