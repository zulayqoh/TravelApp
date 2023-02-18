import 'dart:convert';

import '../data_base/session_manager.dart';

/// JWT helper class for validating and decoding token.

class JwtDecoder {
  /// validates if token is still valid
  bool isTokenValid() {
    bool valid = false;
    try {
      var payload = decodeToken();
      if (payload.isNotEmpty) {
        DateTime expDate =
            DateTime.fromMillisecondsSinceEpoch(payload["exp"] * 1000);
        valid = expDate.isAfter(DateTime.now().add(Duration(days: 7)));
      }
    } catch (err) {
      print(err);
    }
    return valid;
  }

  Map<String, dynamic> decodeToken() {
    try {
      final parts = SessionManager.instance.authToken.split(".");
      if (parts.length != 3) {}
      final payload = _decodeBase64(parts[1]);
      final payloadMap = json.decode(payload);
      return payloadMap;
    } catch (err) {
      return {};
    }
  }

  String _decodeBase64(String str) {
    String output = str.replaceAll('-', '+').replaceAll('_', '/');

    switch (output.length % 4) {
      case 0:
        break;
      case 2:
        output += '==';
        break;
      case 3:
        output += '=';
        break;
      default:
        throw Exception('Illegal base64url string!"');
    }

    return utf8.decode(base64Url.decode(output));
  }
}
