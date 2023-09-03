import 'dart:convert';

import 'package:jwt_decode_full/jwt_decode_full.dart';

JWTData jwtDeco_(String token) {
  final splitToken = token.split('.');
  // if (splitToken.length != 3) {
  //   throw const FormatException('Invalid token');
  // }

  final headerEncoded = splitToken[0];
  final payloadEncoded = splitToken[1];

  final normalizedHeader = base64.normalize(headerEncoded);
  final headerString = utf8.decode(base64.decode(normalizedHeader));
  final decodedHeader = jsonDecode(headerString) as Map<String, dynamic>;

  final normalizedPayload = base64.normalize(payloadEncoded);
  final payloadString = utf8.decode(base64.decode(normalizedPayload));
  final decodedPayload = jsonDecode(payloadString) as Map<String, dynamic>;

  return JWTData(header: decodedHeader, payload: decodedPayload);
}
