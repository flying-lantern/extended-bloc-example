import 'dart:async';
import 'dart:developer';
import 'dart:math' hide log;

import '../util/bloc_status.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cc_base/cc_base_bloc.dart';
import '../cc_base_impl/cc_base_bloc_impl.dart';

part 'extended_impl_event.dart';
part 'extended_impl_state.dart';

/// An example of how [CCBaseBlocImpl] (a concrete implementation of
/// [CCBaseBloc]) can be extended.
///
/// Of key importance here; this type of extension allows for the registration
/// of event handlers. And the concrete methods defined in the parent class may
/// be overridden.
class ExtendedImplBloc extends CCBaseBlocImpl<CCBaseEvent, ExtendedImplState> {
  ExtendedImplBloc() : super(ExtendedInitial()) {
    on<ClearError>(onClearError);
    on<CustomExtendedImplEvent>(_onCustomExtendedEvent);
  }

  @override
  void onClearError(CCBaseEvent event, Emitter<CCBaseStateImpl> emit) {
    log('ExtendedImplBloc: calling onClearError.');
    emit(state.copyWith(errorCode: '0xDEADBEEF'));
    super.onClearError(event, emit);
  }

  void _onCustomExtendedEvent(
      CustomExtendedImplEvent event, Emitter<CCBaseStateImpl> emit) async {
    log('ExtendedImplBloc: calling _onCustomExtendedEvent');
    emit(state.copyWith(status: CCBlocStatus.inProgress));
    await Future.delayed(const Duration(seconds: 3));

    emit(
      state.copyWith(
          extendedProperty: 'Hello',
          blocEvent: event,
          status: Random().nextBool()
              ? CCBlocStatus.success
              : CCBlocStatus.failure),
    );
  }
}
