import 'package:flutter_bloc/flutter_bloc.dart';
import '../util/bloc_status.dart';
import '../cc_base/cc_base_bloc.dart';
import 'dart:developer';

part 'extended_base_event.dart';
part 'extended_base_state.dart';

/// Can extend [CCBaseBloc] directly but must provide own implementations for
/// all abstract methods.
class ExtendedBaseBloc extends CCBaseBloc<CCBaseEvent, ExtendedBaseState> {
  ExtendedBaseBloc() : super(const ExtendedBaseInitial()) {
    on<ClearError>(onClearError);
    on<ExtendedBaseEvent>(_onExtendedBaseEvent);
  }

  @override
  void onClearError(CCBaseEvent event, Emitter<ExtendedBaseState> emit) {
    log('ExtendedBaseBloc: calling onClearError.');
  }

  void _onExtendedBaseEvent(
      ExtendedBaseEvent event, Emitter<ExtendedBaseState> emit) {
    log('ExtendedBaseBloc: calling _onExtendedBaseEvent.');
  }
}
