// ignore_for_file: use_build_context_synchronously

import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:persian_number_utility/persian_number_utility.dart';
import 'package:raavi/config/localization.dart';
import 'package:raavi/logic/authentication/bloc/authentication_bloc.dart';
import 'package:raavi/logic/form_models/models.dart';
import 'package:raavi/logic/helpers/global_helpers.dart';
import 'package:raavi/presentation/widgets/common/bottom_sheet.dart';
import 'package:http/http.dart' as http;
import 'package:raavi/presentation/widgets/form/inputs.dart';

class PhoneBottomSheet extends StatefulWidget {
  const PhoneBottomSheet({
    super.key,
    required this.value,
    required this.showSnackbar,
  });

  final PhoneNumber value;
  final Function showSnackbar;

  @override
  State<PhoneBottomSheet> createState() => _PhoneBottomSheetState();
}

class _PhoneBottomSheetState extends State<PhoneBottomSheet> {
  PhoneNo phoneNo = const PhoneNo.pure();
  bool loading = false;
  bool loading2 = false;
  bool isValid = false;
  bool codeSent = false;
  String code = '';

  Timer? countdownTimer;
  Duration myDuration = const Duration(minutes: 2);

  void startTimer() {
    countdownTimer =
        Timer.periodic(const Duration(seconds: 1), (_) => setCountDown());
  }

  void stopTimer() {
    countdownTimer!.cancel();
  }

  void resetTimer() {
    stopTimer();
    setState(() => myDuration = const Duration(minutes: 2));
  }

  void setCountDown() {
    const reduceSecondsBy = 1;
    if (!mounted) return;
    setState(() {
      final seconds = myDuration.inSeconds - reduceSecondsBy;
      if (seconds < 0) {
        countdownTimer!.cancel();
      } else {
        myDuration = Duration(seconds: seconds);
      }
    });
  }

  @override
  void initState() {
    phoneNo = PhoneNo.dirty(widget.value);
    super.initState();
  }

  submitPhoneChange() async {
    try {
      if (widget.value.phoneNumber != phoneNo.value.phoneNumber) {
        String? token = await getAuthToken();
        if (!phoneNo.invalid && isValid) {
          var res = await http.post(
            getServerRoute(route: '/api/v1/settings/phone_no'),
            body: jsonEncode(
              {
                'phone_no': phoneNo.value.phoneNumber,
              },
            ),
            headers: {
              HttpHeaders.authorizationHeader: token ?? '',
              HttpHeaders.contentTypeHeader: 'application/json; charset=UTF-8',
            },
          );
          if (res.statusCode == 200) {
            setState(() {
              codeSent = true;
              startTimer();
            });
          }
        }
      }
      setState(() {
        loading = false;
      });
    } catch (e) {
      setState(() {
        loading = false;
      });
    }
  }

  submitCodeAndPhone() async {
    try {
      String? token = await getAuthToken();
      if (!phoneNo.invalid && isValid) {
        var res = await http.post(
          getServerRoute(route: '/api/v1/settings/update_phone'),
          body: jsonEncode(
            {
              'phone_no': phoneNo.value.phoneNumber,
              'code': code,
            },
          ),
          headers: {
            HttpHeaders.authorizationHeader: token ?? '',
            HttpHeaders.contentTypeHeader: 'application/json; charset=UTF-8',
          },
        );
        if (res.statusCode == 200) {
          context.read<AuthenticationBloc>().add(
                AuthenticationUserUpdated(
                  phoneNo: phoneNo.value.phoneNumber,
                ),
              );
          Navigator.of(context).pop();
          widget.showSnackbar(
            AppLocalizations.of(context)!.itemSuccessFullyUpdated(
              AppLocalizations.of(context)!.phoneNo,
            ),
            null,
          );
        } else {
          Navigator.of(context).pop();
          widget.showSnackbar(
            AppLocalizations.of(context)!.anUnexpectedErrorOccurred,
            Theme.of(context).colorScheme.secondary,
          );
        }
      }
      setState(() {
        loading2 = false;
      });
    } catch (e) {
      setState(() {
        loading2 = false;
      });
      Navigator.of(context).pop();
      widget.showSnackbar(
        AppLocalizations.of(context)!.anUnexpectedErrorOccurred,
        Theme.of(context).colorScheme.secondary,
      );
    }
  }

  resendCode() async {
    try {
      String? token = await getAuthToken();
      if (!phoneNo.invalid && isValid) {
        var res = await http.post(
          getServerRoute(route: '/api/v1/settings/resend_phone'),
          body: jsonEncode(
            {
              'phone_no': phoneNo.value.phoneNumber,
            },
          ),
          headers: {
            HttpHeaders.authorizationHeader: token ?? '',
            HttpHeaders.contentTypeHeader: 'application/json; charset=UTF-8',
          },
        );
        if (res.statusCode == 200) {
          resetTimer();
          startTimer();
        }
      }
    } catch (e) {
      //
    }
  }

  @override
  Widget build(BuildContext context) {
    String strDigits(int n) => n.toString().padLeft(2, '0');
    final minutes = strDigits(myDuration.inMinutes.remainder(60));
    final seconds = strDigits(myDuration.inSeconds.remainder(60));
    return BlocBuilder<AuthenticationBloc, AuthenticationState>(
      builder: (context, state) {
        return BottomSheetStyle(
          height: !codeSent ? 180 : 260,
          children: !codeSent
              ? [
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: CPhoneField(
                      hintText: AppLocalizations.of(context)!.phoneNo,
                      setValue: (PhoneNumber phone) {
                        setState(() {
                          phoneNo = PhoneNo.dirty(phone);
                        });
                      },
                      setValid: (bool? isValidPassed) {
                        setState(() {
                          isValid = isValidPassed ?? false;
                        });
                      },
                      value: phoneNo.value,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text(AppLocalizations.of(context)!.cancel),
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                Theme.of(context).colorScheme.primary,
                            foregroundColor: Colors.white,
                          ),
                          onPressed: () {
                            setState(() {
                              loading = true;
                            });
                            submitPhoneChange();
                          },
                          child: loading
                              ? const SizedBox(
                                  height: 20,
                                  width: 20,
                                  child: CircularProgressIndicator(
                                    strokeWidth: 2,
                                    color: Colors.white,
                                  ),
                                )
                              : Text(AppLocalizations.of(context)!.send),
                        ),
                      ],
                    ),
                  )
                ]
              : [
                  Text(AppLocalizations.of(context)!
                      .pleaseEnterTheCodeWeSentToNo),
                  const SizedBox(
                    height: 12,
                  ),
                  COTPCodeField(
                    value: code,
                    setValue: (String otpCode) {
                      setState(() {
                        code = otpCode;
                      });
                    },
                  ),
                  Text(
                    Localizations.localeOf(context).languageCode == 'fa'
                        ? AppLocalizations.of(context)!
                            .codeExpiresIn("$minutes:$seconds")
                            .toPersianDigit()
                        : AppLocalizations.of(context)!
                            .codeExpiresIn("$minutes:$seconds"),
                  ),
                  SizedBox(
                    height: 32,
                    child: TextButton(
                      onPressed: () {
                        if (!countdownTimer!.isActive) {
                          resendCode();
                        }
                      },
                      child: Text(
                        AppLocalizations.of(context)!.resendCode,
                        style: const TextStyle(fontSize: 12),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text(AppLocalizations.of(context)!.cancel),
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                Theme.of(context).colorScheme.primary,
                            foregroundColor: Colors.white,
                          ),
                          onPressed: () {
                            setState(() {
                              loading2 = true;
                            });
                            submitCodeAndPhone();
                          },
                          child: loading2
                              ? const SizedBox(
                                  height: 20,
                                  width: 20,
                                  child: CircularProgressIndicator(
                                    strokeWidth: 2,
                                    color: Colors.white,
                                  ),
                                )
                              : Text(
                                      "send"
                                ),
                        ),
                      ],
                    ),
                  )
                ],
        );
      },
    );
  }
}
