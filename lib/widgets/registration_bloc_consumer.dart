import 'package:example_extended_bloc/registration/registration_bloc.dart';
import 'package:example_extended_bloc/widgets/cc_bloc_consumer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// A widget which exposes a builder and listener to react to new states blocs
/// with a state of type [RegistrationState].
class RegistrationBlocConsumer<B extends StateStreamable<RegistrationState>>
    extends StatelessWidget {
  const RegistrationBlocConsumer({
    super.key,
    required this.builder,
    this.listener,
  });

  /// The builder function to invoke for each widget build.
  final Widget Function(BuildContext, RegistrationState) builder;

  /// The listener function to execute once per state change.
  final void Function(BuildContext, RegistrationState)? listener;

  @override
  Widget build(BuildContext context) {
    return CCBlocConsumer<B, RegistrationState>(
      listener: (context, state) {
        if (state.fName?.isEmpty ?? true) {
          const snackBar = SnackBar(content: Text('First name is empty'));
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        } else {
          final snackBar =
              SnackBar(content: Text('First name is: ${state.fName}'));
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
        listener?.call(context, state);
      },
      builder: builder,
    );
  }
}
