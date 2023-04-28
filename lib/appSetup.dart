import 'package:flutter/material.dart';
import 'package:roonyx/blocs/authorisation_cubit.dart';
import 'package:roonyx/screens/authorisation_screen.dart';
import 'package:provider/provider.dart';

class SetUp extends StatelessWidget {
  const SetUp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MultiProvider(providers: [
        Provider<AuthorisationCubit>.value(value: AuthorisationCubit()),
      ], child: const AuthorizationScreen()),
    );
  }
}
