import 'package:example_extended_bloc/cc_base/cc_base_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../util/bloc_status.dart';

part 'cc_base_event_impl.dart';
part 'cc_base_state_impl.dart';

/// Can extend [CCBaseBloc] to provide concrete implementations of all abstract
/// methods. [CCBaseBlocImpl] can then be extended by other blocs as necessary
/// to take advantage of the abstract implementations without having to provide
/// their own. (though implementations may be overridden as necessary.)
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
