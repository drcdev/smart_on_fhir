import 'dart:io';

import 'package:fhir/primitive_types/primitive_types.dart';
import 'package:flutter/material.dart';
import 'package:smart_on_fhir/smart.dart';

import 'enums/enums.dart';
import 'resource_types/r4.dart';
import 'scopes/scopes.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeView(),
    );
  }
}

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 48.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              RaisedButton(
                child: const Text('Press me!'),
                onPressed: () async => await smarter(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Future smarter() async {
  // const thisUrl = 'https://launch.smarthealthit.org/v/r4/sim/eyJoIjoiMSJ9/fhir';
  const thisUrl = 'https://dbhifhir.aidbox.app/fhir';
  final smart = Smart(
    baseUrl: FhirUri(thisUrl),
    clientId: 'web-app',
    redirectUri: FhirUri('com.example.smartonfhir://'),
    scopes: Scopes(
      clinicalScopes: [
        ClinicalScope.r4(
          role: Role.patient,
          type: R4Types.encounter,
          interaction: Interaction.any,
        )
      ],
      encounterLaunch: true,
      openid: true,
      fhirUser: true,
      offlineAccess: true,
    ),
    fhirServer: FhirUri(thisUrl),
    additionalParameters: {
      'login_type': 'provider',
      'aud_validated': '1',
    },
  );

  var auth = await smart.client(secret: 'verysecret');
  final refresh = auth.fold((l) => null, (r) => r.refreshToken);
  sleep(const Duration(seconds: 2));
  final smart2 = Smart(
    baseUrl: FhirUri(thisUrl),
    clientId: 'web-app',
    redirectUri: FhirUri('com.example.smartonfhir://'),
    fhirServer: FhirUri(thisUrl),
    token: smart.token,
    authorize: smart.authorize,
  );
  if (refresh != null) {
    auth = await smart2.refresh(secret: 'verysecret', refreshToken: refresh);
  }
  auth.fold(
    (l) => print(l.errorMessage()),
    (r) {
      print(r.accessToken);
      print(r.refreshToken);
    },
  );
}
