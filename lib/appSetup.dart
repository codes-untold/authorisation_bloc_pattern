import 'package:flutter/material.dart';
import 'package:roonyx/blocs/authorisation_cubit.dart';
import 'package:roonyx/screens/authorisation_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SetUp extends StatelessWidget {
  const SetUp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(
          create: (_) => AuthorisationCubit(),
          child: const AuthorizationScreen()),
    );
  }
}
