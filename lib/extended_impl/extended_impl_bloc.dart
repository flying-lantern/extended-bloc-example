import 'dart:async';
import 'dart:developer';

import '../util/bloc_status.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cc_base/cc_base_bloc.dart';
import '../cc_base_impl/cc_base_bloc_impl.dart';

part 'extended_impl_event.dart';
part 'extended_impl_state.dart';

int _n = 0;

/// An example of how [CCBaseBlocImpl] (a concrete implementation of
/// [CCBaseBloc]) can be extended. Of key importance here; this type of
/// extension allows for the registration of event handlers. And the concrete
/// methods defined in the parent class may be overridden.
class ExtendedImplBloc extends CCBaseBlocImpl<CCBaseEvent, ExtendedImplState> {
  ExtendedImplBloc() : super(ExtendedInitial()) {
    on<ClearError>(onClearError);
    on<CustomExtendedImplEvent>(_onCustomExtendedEvent);
  }

  @override
  void onClearError(CCBaseEvent event, Emitter<CCBaseStateImpl> emit) {
    log('ExtendedImplBloc: calling onClearError.');
    _n++;
    emit(state.copyWith(errorCode: '$_n'));
    super.onClearError(event, emit);
  }

  void _onCustomExtendedEvent(
      CustomExtendedImplEvent event, Emitter<CCBaseStateImpl> emit) async {
    log('ExtendedImplBloc: calling _onCustomExtendedEvent');
    emit(state.copyWith(status: CCBlocStatus.inProgress));
    await Future.delayed(const Duration(seconds: 3));

    _n++;
    emit(
      state.copyWith(
          extendedProperty: 'Hello; extended: $_n',
          blocEvent: event,
          status: _n.isEven ? CCBlocStatus.success : CCBlocStatus.failure),
    );
  }
}
