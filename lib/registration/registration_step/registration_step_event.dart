part of 'registration_step_bloc.dart';

sealed class RegistrationStepEvent extends RegistrationEvent {
  const RegistrationStepEvent();

  @override
  List<Object> get props => [];
}

final class EventOne extends RegistrationStepEvent {
  const EventOne();
}
