import 'dart:developer';
import 'extended_base/extended_base_bloc.dart';
import 'widgets/registration_bloc_consumer.dart';
import 'extended_impl/extended_impl_bloc.dart';
import 'registration/registration_bloc.dart';
import 'registration/registration_step/registration_step_bloc.dart';
import 'widgets/cc_bloc_consumer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loader_overlay/loader_overlay.dart';

void main() {
  runApp(const BlocDemo());
}

class BlocDemo extends StatelessWidget {
  const BlocDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Extended Bloc Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const LoaderOverlay(child: _BlocDemo()),
    );
  }
}

class _BlocDemo extends StatelessWidget {
  const _BlocDemo();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Extended Bloc Demo'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: const [
              _ExtendedImplBlocWidget(),
              _ExtendedBaseBlocWidget(),
              _RegistrationBlocWidget(),
              _RegistrationStepBlocWidget(),
            ]
                .map((e) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: e,
                    ))
                .toList(),
          ),
        ),
      ),
    );
  }
}

class _ExtendedImplBlocWidget extends StatelessWidget {
  const _ExtendedImplBlocWidget();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ExtendedImplBloc>(
      create: (_) => ExtendedImplBloc(),
      child: CCBlocConsumer<ExtendedImplBloc, ExtendedImplState>(
        listener: (context, state) =>
            log('Listener for ExtendedImplBloc called'),
        builder: (context, state) {
          return ElevatedButton(
            onPressed: () => context
                .read<ExtendedImplBloc>()
                .add(const CustomExtendedImplEvent(eventProperty: 'test')),
            child: const Text('ExtendedImplBloc'),
          );
        },
      ),
    );
  }
}

class _ExtendedBaseBlocWidget extends StatelessWidget {
  const _ExtendedBaseBlocWidget();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ExtendedBaseBloc>(
      create: (_) => ExtendedBaseBloc(),
      child: CCBlocConsumer<ExtendedBaseBloc, ExtendedBaseState>(
        listener: (context, state) =>
            log('Listener for ExtendedImplBloc called'),
        builder: (context, state) {
          return ElevatedButton(
            onPressed: () =>
                context.read<ExtendedBaseBloc>().add(const ExtendedBaseEvent()),
            child: const Text('ExtendedBaseBloc'),
          );
        },
      ),
    );
  }
}

class _RegistrationBlocWidget extends StatelessWidget {
  const _RegistrationBlocWidget();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<RegistrationBloc>(
      create: (_) => RegistrationBloc(),
      child: RegistrationBlocConsumer<RegistrationBloc>(
        listener: (context, state) =>
            log('Listener for RegistrationBloc called'),
        builder: (context, state) => ElevatedButton(
          onPressed: () =>
              context.read<RegistrationBloc>().add(const AgeChanged(age: 4)),
          child: const Text('RegistrationBloc'),
        ),
      ),
    );
  }
}

class _RegistrationStepBlocWidget extends StatelessWidget {
  const _RegistrationStepBlocWidget();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<RegistrationStepBloc>(
      create: (context) => RegistrationStepBloc(),
      child: RegistrationBlocConsumer<RegistrationStepBloc>(
        listener: (context, state) =>
            log('Listener for RegistrationStepBloc called'),
        builder: (context, state) => ElevatedButton(
          onPressed: () => context
              .read<RegistrationStepBloc>()
              .add(const FirstNameChanged(name: '')),
          child: const Text('RegistrationStepBloc'),
        ),
      ),
    );
  }
}
