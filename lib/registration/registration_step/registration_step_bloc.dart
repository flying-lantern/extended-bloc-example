import 'dart:developer';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../registration_bloc.dart';

part 'registration_step_event.dart';
part 'registration_step_state.dart';

class RegistrationStepBloc extends RegistrationBloc {
  RegistrationStepBloc() : super() {
    on<EventOne>(_onEventOne);
  }

  void _onEventOne(EventOne event, Emitter<RegistrationState> emit) {
    log('RegistrationStepBloc: calling _onEventOne.');
  }

  @override
  void onFirstNameChanged(
      FirstNameChanged event, Emitter<RegistrationState> emit) {
    log('RegistrationStepBloc: calling onFirstNameChanged.');
    super.onFirstNameChanged(event, emit);
  }
}
