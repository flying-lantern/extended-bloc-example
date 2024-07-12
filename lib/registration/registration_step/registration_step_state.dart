part of 'registration_step_bloc.dart';

sealed class RegistrationStepState extends RegistrationState {
  const RegistrationStepState();

  @override
  List<Object> get props => [];
}

final class RegistrationStepInitial extends RegistrationStepState {}
