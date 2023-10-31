import 'dart:convert';

import 'package:cargo/config/config.dart';
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
