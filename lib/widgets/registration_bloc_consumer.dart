import 'package:example_extended_bloc/registration/registration_bloc.dart';
import 'package:example_extended_bloc/widgets/cc_bloc_consumer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegistrationBlocConsumer<B extends StateStreamable<S>,
    S extends RegistrationState> extends StatelessWidget {
  const RegistrationBlocConsumer({
    super.key,
    required this.builder,
  });

  final Widget Function(BuildContext, S) builder;

  @override
  Widget build(BuildContext context) {
    return CCBlocConsumer<B, S>(
      listener: (context, state) {
        if (state.fName?.isEmpty ?? true) {
          const snackBar = SnackBar(content: Text('First name is empty'));
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        } else {
          final snackBar =
              SnackBar(content: Text('First name is: ${state.fName}'));
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
      },
      builder: builder,
    );
  }
}
