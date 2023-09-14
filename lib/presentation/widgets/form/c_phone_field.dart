import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:intl_phone_number_input/intl_phone_number_util.dart';

// ignore: must_be_immutable
class CPhoneField extends StatefulWidget {
  final String hintText;
  final Function setValue;
  final Function setValid;
  final PhoneNumber? value;
  bool enabled;
  CPhoneField({
    super.key,
    required this.hintText,
    required this.setValue,
    required this.setValid,
    required this.value,
    this.enabled = true,
  });

  @override
  State<CPhoneField> createState() => _CPhoneFieldState();
}

class _CPhoneFieldState extends State<CPhoneField> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: InternationalPhoneNumberInput(
        isEnabled: widget.enabled,
        onInputChanged: (PhoneNumber number) async {
          bool? isValidPhoneNumber = await PhoneNumberUtil.isValidNumber(
            phoneNumber: number.phoneNumber,
            isoCode: number.isoCode ?? '',
          );
          widget.setValue(number);
          widget.setValid(isValidPhoneNumber);
        },
        selectorConfig: const SelectorConfig(
          selectorType: PhoneInputSelectorType.bottomSheet,
        ),
        ignoreBlank: false,
        autoValidateMode: AutovalidateMode.onUserInteraction,
        selectorTextStyle: const TextStyle(color: Colors.black),
        initialValue: widget.value,
        formatInput: true,
        locale: Localizations.localeOf(context).languageCode,
        keyboardType:
            const TextInputType.numberWithOptions(signed: true, decimal: true),
        inputBorder: const OutlineInputBorder(),
        onSaved: (PhoneNumber number) {},
        errorMessage: "AppLocalizations.of(context)!.invalidMobilePhoneNo",
        inputDecoration: InputDecoration(
          filled: true,
          fillColor: Colors.grey[200],
          hintText: "phoneNo",
          contentPadding: const EdgeInsets.symmetric(
            vertical: 12,
            horizontal: 16,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6.0),
            borderSide: const BorderSide(
              width: 0,
              style: BorderStyle.none,
            ),
          ),
        ),
        searchBoxDecoration: InputDecoration(
          filled: true,
          fillColor: Colors.grey[200],
          hintText: "country",
          contentPadding: const EdgeInsets.symmetric(
            vertical: 12,
            horizontal: 16,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6.0),
            borderSide: const BorderSide(
              width: 0,
              style: BorderStyle.none,
            ),
          ),
        ),
      ),
    );
  }
}
