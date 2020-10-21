import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:fhir/primitive_types/primitive_types.dart';
import 'package:flutter_appauth/flutter_appauth.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:fhir/dstu2.dart' as dstu2;
import 'package:fhir/stu3.dart' as stu3;
import 'package:fhir/r4.dart' as r4;
import 'package:fhir/r5.dart' as r5;
import 'package:http/http.dart';
import 'package:smart_on_fhir/resource_types/resource_types.dart';

import 'request/capabilities_request.dart';
import 'scope.dart';
import 'smart_failure.dart';

part 'smart.freezed.dart';

@freezed
abstract class Smart implements _$Smart {
  Smart._();
  factory Smart({
    @Default(FhirV.r4) FhirV version,
    @required FhirUri baseUrl,
    @required String clientId,
    @required FhirUri redirectUri,
    String launch,
    List<Scope> scope,
    @required FhirUri fhirServer,
  }) = _Smart;

  Future<Either<SmartFailure, Unit>> client() async {
    dynamic conformanceStatement;
    FhirUri token;
    FhirUri authorize;
    switch (version) {
      case FhirV.dstu2:
        {
          conformanceStatement =
              await CapabilitiesRequest.dstu2(base: Uri.parse('$baseUrl'))
                  .request();
          conformanceStatement.fold((l) => null, (r) {
            token = _getUri(r as dstu2.Conformance, 'token');
            authorize = _getUri(r as dstu2.Conformance, 'authorize');
          });
        }
        break;
      case FhirV.stu3:
        {
          conformanceStatement =
              await CapabilitiesRequest.stu3(base: Uri.parse('$baseUrl'))
                  .request();
          conformanceStatement.fold((l) => null, (r) {
            token = _getUri(r as stu3.CapabilityStatement, 'token');
            authorize = _getUri(r as stu3.CapabilityStatement, 'authorize');
          });
        }
        break;
      case FhirV.r4:
        {
          conformanceStatement =
              await CapabilitiesRequest.r4(base: Uri.parse('$baseUrl'))
                  .request();
          conformanceStatement.fold((l) => null, (r) {
            token = _getUri(r as r4.CapabilityStatement, 'token');
            authorize = _getUri(r as r4.CapabilityStatement, 'authorize');
          });
        }
        break;
      case FhirV.r5:
        {
          conformanceStatement =
              await CapabilitiesRequest.r5(base: Uri.parse('$baseUrl'))
                  .request();
          conformanceStatement.fold((l) => null, (r) {
            token = _getUri(r as r5.CapabilityStatement, 'token');
            authorize = _getUri(r as r5.CapabilityStatement, 'authorize');
          });
        }
        break;
    }

    if (authorize == null) {
      return left(SmartFailure.noAuthorizationEndpoint(baseUrl: baseUrl));
    }
    if (token == null) {
      return left(SmartFailure.noTokenEndpoint(baseUrl: baseUrl));
    }

    final appAuth = FlutterAppAuth();

    AuthorizationTokenResponse authorization;
    print('trying authorization');
    try {
      authorization = await appAuth.authorizeAndExchangeCode(
        AuthorizationTokenRequest(
            'clientId', 'com.example.smartonfhir://login-callback',
            serviceConfiguration: AuthorizationServiceConfiguration(
                authorize.toString(), token.toString()),
            scopes: _getScopes(),
            additionalParameters: {
              'login_type': 'provider',
              'aud_validated': '1',
            }),
      );
    } catch (e) {
      print(e.toString());
    }
    print(authorization.accessToken);
  }

  List<String> _getScopes() {
    var scopeList = <String>[];
    for (var s in scope) {
      scopeList.add(s.toString());
    }
    return scopeList;
  }

  FhirUri _getUri(dynamic capabilityStatement, String type) {
    if (capabilityStatement?.rest == null) {
      return null;
    } else if (capabilityStatement.rest[0]?.security?.extension_ == null) {
      return null;
    } else if (capabilityStatement.rest[0].security.extension_[0]?.extension_ ==
        null) {
      return null;
    } else {
      final statement = capabilityStatement
          .rest[0].security.extension_[0].extension_
          .firstWhere((ext) => ext.url.toString() == type, orElse: () => null);
      if (statement == null) {
        return statement;
      } else {
        return statement.valueUri;
      }
    }
  }
}

Map<String, dynamic> parseIdToken(String idToken) {
  final parts = idToken.split(r'.');
  assert(parts.length == 3);

  return jsonDecode(
      utf8.decode(base64Url.decode(base64Url.normalize(parts[1]))));
}

Future<Map<String, dynamic>> getUserDetails(
    String accessToken, String domain) async {
  final url = 'https://$domain/userinfo';
  final response = await get(
    url,
    headers: {'Authorization': 'Bearer $accessToken'},
  );

  if (response.statusCode == 200) {
    return jsonDecode(response.body);
  } else {
    throw Exception('Failed to get user details');
  }
}

Future smarter() async {
  const thisUrl = 'https://launch.smarthealthit.org/v/r4/sim/eyJoIjoiMSJ9/fhir';
  final smart = Smart(
    baseUrl: FhirUri(thisUrl),
    clientId: 'web-app',
    redirectUri: FhirUri('com.auth0.fhir_at_rest://smart-callback'),
    scope: [
      Scope.clinicalR4(
        role: Role.patient,
        type: R4Types.encounter,
        interaction: Interaction.any,
      ),
      Scope.context(encounterLaunch: true),
      Scope.identity(openid: true, fhirUser: true),
      Scope.refreshToken(offlineAccess: true)
    ],
    fhirServer: FhirUri(thisUrl),
  );

  await smart.client();
}

enum FhirV {
  dstu2,
  stu3,
  r4,
  r5,
}