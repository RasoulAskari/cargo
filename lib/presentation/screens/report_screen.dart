import 'package:cargo/config/localization.dart';
import 'package:cargo/logic/report/bloc/report_bloc.dart';
import 'package:cargo/presentation/widgets/transction_item.dart';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_bloc/flutter_bloc.dart';

class ReportScreen extends StatelessWidget {
  const ReportScreen({super.key});

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
          AppLocalizations.of(context)!.report_screen,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: BlocBuilder<ReportBloc, ReportState>(
        builder: (context, state) {
          if (state.status == ReportStatus.initial) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 20,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(AppLocalizations.of(context)!.account_money),
                        Text(state.reports.first['account_money'].toString()),
                        const Icon(
                          Icons.emoji_events,
                          size: 30,
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  Container(
                      height: 200,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 20,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              TransctionItem(
                                icon: const Icon(
                                  Icons.card_travel,
                                  color: Colors.white,
                                  size: 45,
                                ),
                                value: state.reports.first['transactions'][0]
                                    .toString(),
                                label: AppLocalizations.of(context)!.order,
                                color: Colors.green.shade300,
                              ),
                              TransctionItem(
                                icon: const Icon(
                                  Icons.fire_truck_sharp,
                                  color: Colors.white,
                                  size: 45,
                                ),
                                value: state.reports.first['transactions'][1]
                                    .toString(),
                                label: AppLocalizations.of(context)!.cars,
                                color: Colors.blue.shade300,
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              TransctionItem(
                                icon: const Icon(
                                  Icons.touch_app,
                                  color: Colors.white,
                                  size: 45,
                                ),
                                value: state.reports.first['transactions'][2]
                                    .toString(),
                                label: AppLocalizations.of(context)!
                                    .incoming_outgoing,
                                color: Colors.green.shade500,
                              ),
                              TransctionItem(
                                icon: const Icon(
                                  Icons.swap_vertical_circle_outlined,
                                  color: Colors.white,
                                  size: 45,
                                ),
                                value: state.reports.first['transactions'][3]
                                    .toString(),
                                label: AppLocalizations.of(context)!
                                    .exchange_money,
                                color: Colors.yellow,
                              ),
                            ],
                          ),
                        ],
                      ))
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
