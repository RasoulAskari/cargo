import 'dart:convert';

import 'package:cargo/config/config.dart';
import 'package:cargo/config/localization.dart';
import 'package:cargo/logic/form_models/c_string.dart';
import 'package:cargo/logic/form_models/email.dart';
import 'package:cargo/logic/form_models/first_name.dart';
import 'package:cargo/logic/form_models/password.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
// ignore: depend_on_referenced_packages
import 'package:toast/toast.dart';

const _storage = FlutterSecureStorage();

Uri getServerRoute(
    {required String route, Map<String, dynamic> params = const {}}) {
  String? url = serverAddress;
  var splited = url.split('//');
  if (splited[0] == 'http:') {
    return Uri.http(
      splited[1],
      route,
      params,
    );
  } else {
    return Uri.https(
      splited[1],
      route,
      params,
    );
  }
}

Future<String?> getAuthToken() async {
  try {
    final jsonModel = await _storage.read(key: 'user');
    final jsonData = jsonDecode(jsonModel.toString());
    return await jsonData['token'];
  } catch (e) {
    return null;
  }
}

Future<bool> checkUserPermission(String permission) async {
  try {
    final data = await _storage.read(key: 'user');
    final p = jsonDecode(data.toString())['user']['permissions'] as List;

    final res = p.contains(permission);
    return res;
  } catch (e) {
    return false;
  }
}

Future<void> checkPermissionRoute(
    String route, String role, BuildContext context) async {
  ToastContext().init(context);

  final res = await checkUserPermission(role);
  res
      // ignore: use_build_context_synchronously
      ? Navigator.of(context).pushNamed(route)
      : Toast.show("Access Deny");
}

Future<void> checkPermissionAction(
    Function function, String role, BuildContext context) async {
  ToastContext().init(context);

  final res = await checkUserPermission(role);
  res
      // ignore: use_build_context_synchronously
      ? function()
      : Toast.show("Access Deny");
}

String? getFirstnameError(
    FirstNameValidationError? error, BuildContext context) {
  switch (error) {
    case FirstNameValidationError.empty:
      return AppLocalizations.of(context)!
          .itemCanNotBeEmpty(AppLocalizations.of(context)!.firstname);
    case FirstNameValidationError.min:
      return AppLocalizations.of(context)!.itemCanNotBeLessThanMaxCharacters(
        AppLocalizations.of(context)!.firstname,
        6.toString(),
      );
    case FirstNameValidationError.max:
      return AppLocalizations.of(context)!.itemCanNotBeMoreThanMaxCharacters(
        AppLocalizations.of(context)!.firstname,
        32.toString(),
      );
    default:
      return null;
  }
}

String? getEmailError(EmailValidationError? error, BuildContext context) {
  switch (error) {
    case EmailValidationError.empty:
      return AppLocalizations.of(context)!
          .itemCanNotBeEmpty(AppLocalizations.of(context)!.email);
    case EmailValidationError.invalid:
      return AppLocalizations.of(context)!.invalid_email;
    default:
      return null;
  }
}

String? getPasswordError(PasswordValidationError? error, BuildContext context) {
  switch (error) {
    case PasswordValidationError.empty:
      return AppLocalizations.of(context)!
          .itemCanNotBeEmpty(AppLocalizations.of(context)!.password);
    case PasswordValidationError.min:
      return AppLocalizations.of(context)!.itemCanNotBeLessThanMaxCharacters(
        AppLocalizations.of(context)!.password,
        8.toString(),
      );
    case PasswordValidationError.max:
      return AppLocalizations.of(context)!.itemCanNotBeMoreThanMaxCharacters(
        AppLocalizations.of(context)!.password,
        32.toString(),
      );
    default:
      return null;
  }
}

String? getCStringError(CStringValidationError? error, BuildContext context) {
  switch (error) {
    case CStringValidationError.empty:
      return AppLocalizations.of(context)!
          .itemCanNotBeEmpty(AppLocalizations.of(context)!.role);
    case CStringValidationError.min:
      return AppLocalizations.of(context)!.itemCanNotBeLessThanMaxCharacters(
        AppLocalizations.of(context)!.role,
        8.toString(),
      );
    case CStringValidationError.max:
      return AppLocalizations.of(context)!.itemCanNotBeMoreThanMaxCharacters(
        AppLocalizations.of(context)!.role,
        32.toString(),
      );
    default:
      return null;
  }
}
