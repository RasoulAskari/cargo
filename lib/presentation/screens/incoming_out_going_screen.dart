import 'package:cargo/logic/incoming_out_going/bloc/bloc/incoming_out_going_bloc.dart';
import 'package:cargo/presentation/widgets/incoming_out_going_item.dart';
import 'package:flutter/material.dart';
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
        actions: [
          IconButton(
              onPressed: () {},
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
        backgroundColor: Theme.of(context).primaryColor,
        title: const Text(
          "Incoming Out Going",
          style: TextStyle(
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
