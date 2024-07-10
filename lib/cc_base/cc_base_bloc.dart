import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc_status.dart';

part 'cc_base_event.dart';
part 'cc_base_state.dart';

class CCBaseBloc<Event, State extends CCBaseState> extends Bloc<Event, State> {
  CCBaseBloc(super.initialState);

  // CCBaseBloc() : super(const CCBaseInitial());

  void onClearError(Event event, Emitter<CCBaseState> emit) {
    emit(state.copyWith(
      errorCode: '',
      errorMessage: '',
      status: CCBlocStatus.initial,
    ));
  }
}
