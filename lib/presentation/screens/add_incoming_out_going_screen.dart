import 'package:cargo/config/localization.dart';
import 'package:cargo/constants/routes.dart';
import 'package:cargo/logic/form_models/c_string.dart';
import 'package:cargo/logic/helpers/global_helpers.dart';
import 'package:cargo/logic/incoming_out_going/bloc/bloc/incoming_out_going_bloc.dart';
import 'package:cargo/logic/incoming_out_going/model/incoming_out_going.dart';
import 'package:cargo/logic/login/user_model.dart';
import 'package:cargo/logic/form_models/amount.dart';
import 'package:cargo/presentation/widgets/form/c_date_picker.dart';
import 'package:cargo/presentation/widgets/form/c_drop_down.dart';
import 'package:cargo/presentation/widgets/form/c_text_field.dart';
import 'package:cargo/presentation/widgets/input_label.dart';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
// ignore: depend_on_referenced_packages
import 'package:formz/formz.dart';
// ignore: depend_on_referenced_packages
import 'package:toast/toast.dart';

class AddIncomingOutGoingScreen extends StatefulWidget {
  final IncomingOutGoing? incomingOutGoing;
  const AddIncomingOutGoingScreen({super.key, this.incomingOutGoing});

  @override
  State<AddIncomingOutGoingScreen> createState() =>
      _AddIncomingOutGoingScreenState();
}

class _AddIncomingOutGoingScreenState extends State<AddIncomingOutGoingScreen> {
  DateTime? _date;
  CString name = const CString.pure();
  Amount amount = const Amount.pure();
  CString incomingOutGoingType = const CString.pure();

  @override
  void initState() {
    super.initState();
    _checkIncoming();
  }

  _checkIncoming() {
    if (widget.incomingOutGoing != null) {
      final incoming = widget.incomingOutGoing;
      setState(() {
        _date = DateTime.parse(incoming!.createdAt);
        name = CString.dirty(incoming.name);
        amount = Amount.dirty(incoming.amount);
        incomingOutGoingType = CString.dirty(incoming.type);
      });
    }
  }

  validate() {
    bool valid = Formz.validate([
      incomingOutGoingType,
      amount,
      name,
    ]);
    return valid;
  }

  Future<void> _addIncoming() async {
    if (validate() && _date != null) {
      IncomingOutGoing incomingOutGoing = IncomingOutGoing(
        id: 1,
        createdAt: _date.toString(),
        name: name.value,
        type: incomingOutGoingType.value,
        amount: double.parse(amount.value.toString()),
        createdBy:
            const UserModel(email: "admin@admin.com", name: "admin", id: 1),
      );

      context.read<IncomingOutGoingBloc>().add(
            AddIncomingOutGoingEvent(
                incomingOutGoing: incomingOutGoing, date: _date),
          );

      Navigator.of(context).pop();
    }
  }

  _editIncoming() {
    if (validate() && _date != null) {
      final inco = widget.incomingOutGoing;
      IncomingOutGoing incoming = IncomingOutGoing(
        id: inco!.id,
        createdAt: _date.toString(),
        name: name.value,
        type: incomingOutGoingType.value,
        amount: amount.value,
        createdBy:
            const UserModel(name: "admin", email: "admin@admin.com", id: 1),
      );

      context.read<IncomingOutGoingBloc>().add(
            EditIncomingOutGoingEvent(incomingOutGoing: incoming),
          );
      Navigator.of(context).pushReplacementNamed(addIncomingOutGoing);
    } else {
      Toast.show(AppLocalizations.of(context)!.validate_input);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
        ),
        backgroundColor: Theme.of(context).primaryColor,
        title: Text(
          AppLocalizations.of(context)!.add_incoming_outgoing_screen,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: BlocProvider(
        create: (context) => IncomingOutGoingBloc(
          httpClient: http.Client(),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
          child: Column(
            children: [
              InputLabel(label: AppLocalizations.of(context)!.register_date),
              CDatePicker(
                value: _date,
                setValue: (value) {
                  setState(() {
                    _date = value;
                  });
                },
                hintText: AppLocalizations.of(context)?.register_date,
              ),
              InputLabel(label: AppLocalizations.of(context)!.type),
              CDropdown(
                errorText: incomingOutGoingType.isNotValid
                    ? getCStringError(incomingOutGoingType.error, context,
                        AppLocalizations.of(context)!.type)
                    : null,
                value: incomingOutGoingType.value,
                hintText: AppLocalizations.of(context)?.type,
                setValue: (value) {
                  incomingOutGoingType = CString.dirty(value);
                },
                items: [
                  {
                    'value': 'incoming',
                    'label': AppLocalizations.of(context)?.incoming,
                  },
                  {
                    'value': 'out_going',
                    'label': AppLocalizations.of(context)?.outgoing,
                  },
                ],
              ),
              InputLabel(label: AppLocalizations.of(context)!.amount),
              CTextField(
                errorText: amount.isNotValid
                    ? getAmountError(amount.error, context,
                        AppLocalizations.of(context)!.amount)
                    : null,
                textInputType: TextInputType.number,
                hintText: AppLocalizations.of(context)?.amount,
                value: amount.value.toString(),
                setValue: (value) {
                  try {
                    double intValue = double.parse(value);
                    amount = Amount.dirty(intValue);
                  } catch (e) {
                    return;
                  }
                },
              ),
              InputLabel(label: AppLocalizations.of(context)!.item_name),
              CTextField(
                errorText: name.isNotValid
                    ? getCStringError(name.error, context,
                        AppLocalizations.of(context)!.item_name)
                    : null,
                hintText: AppLocalizations.of(context)?.item_name,
                value: name.value,
                setValue: (value) {
                  setState(() {
                    name = CString.dirty(value);
                  });
                },
              ),
              const SizedBox(height: 15),
              ElevatedButton(
                onPressed: () {
                  widget.incomingOutGoing != null
                      ? _editIncoming()
                      : _addIncoming();
                  _addIncoming();
                },
                child: Text(
                  widget.incomingOutGoing != null
                      ? AppLocalizations.of(context)!.edit
                      : AppLocalizations.of(context)!.add,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
