import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../../util/bloc_status.dart';

part 'cc_base_event.dart';
part 'cc_base_state.dart';

/// The CCBloc from which other blocs are expected to extend.
///
/// [CCBaseBloc] is abstract and only provides the prototypes of methods that
/// subclasses must implement.
abstract class CCBaseBloc<Event, State extends CCBaseState>
    extends Bloc<Event, State> {
  CCBaseBloc(super.initialState);

  /// A method to clear all error states previously set.
  void onClearError(Event event, Emitter<State> emit);
}
