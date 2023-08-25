import 'package:cargo/config/config.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';


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
    var token = await _storage.read(key: 'token');
    return token;
  } catch (e) {
    return null;
  }
}
