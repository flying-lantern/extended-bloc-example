import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '../bloc_status.dart';

part 'cc_base_event.dart';
part 'cc_base_state.dart';

abstract class CCBaseBloc<Event, State extends CCBaseState>
    extends Bloc<Event, State> {
  CCBaseBloc(super.initialState);

  void onClearError(covariant Event event, Emitter<State> emit);
}
