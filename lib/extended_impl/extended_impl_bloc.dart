import 'dart:async';

import '../util/bloc_status.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cc_base/cc_base_bloc.dart';
import '../cc_base_impl/cc_base_bloc_impl.dart';

part 'extended_impl_event.dart';
part 'extended_impl_state.dart';

int _n = 0;

class ExtendedImplBloc extends CCBaseBlocImpl<CCBaseEvent, ExtendedImplState> {
  ExtendedImplBloc() : super(ExtendedInitial()) {
    on<ClearError>(onClearError);
    on<CustomExtendedImplEvent>(_onCustomExtendedEvent);
  }

  @override
  void onClearError(CCBaseEvent event, Emitter<CCBaseStateImpl> emit) {
    super.onClearError(event, emit);
    print('did an override');
    _n++;
    emit(state.copyWith(errorCode: '$_n'));
  }

  void _onCustomExtendedEvent(
      CustomExtendedImplEvent event, Emitter<CCBaseStateImpl> emit) async {
    print('Executing custom event: ${event.eventProp}');
    emit(state.copyWith(status: CCBlocStatus.inProgress));
    await Future.delayed(const Duration(seconds: 3));
    _n++;
    emit(state.copyWith(
        extendedProperty: 'Hello; extended: $_n',
        blocEvent: event,
        status: _n.isEven ? CCBlocStatus.success : CCBlocStatus.failure));
  }
}
