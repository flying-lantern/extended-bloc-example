import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../registration_bloc.dart';

part 'registration_step_event.dart';
part 'registration_step_state.dart';

class RegistrationStepBloc extends RegistrationBloc {
  RegistrationStepBloc() : super() {
    on<EventOne>(_onEventOne);
  }

  FutureOr<void> _onEventOne(EventOne event, Emitter<RegistrationState> emit) {
    print('Event one!');
  }
}
