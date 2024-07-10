import 'dart:async';

import 'package:example_extended_bloc/bloc_status.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cc_base_impl/cc_base_bloc_impl.dart';

part 'extended_event.dart';
part 'extended_state.dart';

int _n = 0;

class ExtendedBloc extends CCBaseBloc<CCBaseEvent, ExtendedState> {
  ExtendedBloc() : super(ExtendedInitial()) {
    on<ClearError>(onClearError);
    on<CustomExtendedEvent>(_onCustomExtendedEvent);
  }

  @override
  void onClearError(CCBaseEvent event, Emitter<CCBaseState> emit) {
    super.onClearError(event, emit);
    print('did an override');
    _n++;
    emit(state.copyWith(errorCode: '$_n'));
  }

  void _onCustomExtendedEvent(
      CustomExtendedEvent event, Emitter<CCBaseState> emit) async {
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
