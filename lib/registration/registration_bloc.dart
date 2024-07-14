import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:example_extended_bloc/cc_base_impl/cc_base_bloc_impl.dart';
import 'package:example_extended_bloc/util/bloc_status.dart';

import '../cc_base/cc_base_bloc.dart';

part 'registration_event.dart';
part 'registration_state.dart';

class RegistrationBloc extends CCBaseBlocImpl<CCBaseEvent, RegistrationState> {
  RegistrationBloc() : super(RegistrationInitial()) {
    on<FirstNameChanged>(onFirstNameChanged);
    on<LastNameChanged>(_onLastNameChanged);
    on<AgeChanged>(_onAgeChanged);
  }

  void onFirstNameChanged(
      FirstNameChanged event, Emitter<RegistrationState> emit) {
    log('RegistrationBloc: calling onFirstNameChanged.');
    emit(state.copyWith(status: CCBlocStatus.inProgress));
    emit(state.copyWith(fName: event.name, status: CCBlocStatus.success));
  }

  void _onLastNameChanged(
      LastNameChanged event, Emitter<RegistrationState> emit) {
    log('RegistrationBloc: calling _onLastNameChanged.');
  }

  void _onAgeChanged(AgeChanged event, Emitter<RegistrationState> emit) {
    log('RegistrationBloc: calling _onAgeChanged.');
  }

  @override
  void onInit(Init event, Emitter<CCBaseStateImpl> emit) {
    log('RegistrationBloc: calling _onInit.');
    super.onInit(event, emit);
  }
}
