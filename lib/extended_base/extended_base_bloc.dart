import 'package:flutter_bloc/flutter_bloc.dart';
import '../util/bloc_status.dart';
import '../cc_base/cc_base_bloc.dart';
import 'dart:developer';

part 'extended_base_event.dart';
part 'extended_base_state.dart';

/// A direct extension of [CCBaseBloc].
///
/// Must provide own implementation of all parent events, but is free to define
/// its own events along with the event handlers.
///
/// While this direct extension of [CCBaseBloc] may seem very similar to the
/// extension made by [CCBaseBlocImpl], the key difference is that extending
/// this way allows [ExtendedBaseBloc] to register its own event handlers.
///
/// However, unlike [CCBaseBlocImpl] when this bloc is extended, the child
/// bloc's state
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
