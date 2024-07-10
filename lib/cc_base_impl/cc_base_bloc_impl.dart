import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc_status.dart';

part 'cc_base_event_impl.dart';
part 'cc_base_state_impl.dart';

class CCBaseBlocImpl<Event, State extends CCBaseStateImpl>
    extends Bloc<Event, State> {
  CCBaseBlocImpl(super.initialState);

  // CCBaseBloc() : super(const CCBaseInitial());

  void onClearError(Event event, Emitter<CCBaseStateImpl> emit) {
    emit(state.copyWith(
      errorCode: '',
      errorMessage: '',
      status: CCBlocStatus.initial,
    ));
  }
}
