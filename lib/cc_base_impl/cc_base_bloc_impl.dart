import 'package:example_extended_bloc/cc_base/cc_base_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc_status.dart';

part 'cc_base_event_impl.dart';
part 'cc_base_state_impl.dart';

class CCBaseBlocImpl<Event, State extends CCBaseStateImpl>
    extends CCBaseBloc<Event, State> {
  CCBaseBlocImpl(super.initialState);

  @override
  void onClearError(covariant Event event, Emitter<CCBaseStateImpl> emit) {
    emit(state.copyWith(
      errorCode: '',
      errorMessage: '',
      status: CCBlocStatus.initial,
    ));
  }
}
