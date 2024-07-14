import 'dart:developer';
import 'package:example_extended_bloc/cc_base/cc_base_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../util/bloc_status.dart';

part 'cc_base_event_impl.dart';
part 'cc_base_state_impl.dart';

/// Can extend [CCBaseBloc] to provide concrete implementations of all abstract
/// methods. [CCBaseBlocImpl] can then be extended by other blocs as necessary
/// to take advantage of the concrete implementations without having to provide
/// their own (though implementations may be overridden as necessary).
///
/// However, for this bloc itself to be extensible the Event type parameter must
/// be unconstrained.
///
/// Owing to the unconstrained nature of Event, [CCBaseBlocImpl] is unable to
/// define its own events. Since that would mean having a specific type for the
/// Event type parameter which would severely cripple the ability of the
/// programmer to extend this bloc ass they wish.
///
/// This therefore means that the purpose of this bloc is to provide an
/// implementation for the abstract methods in [CCBaseBloc]. This bloc cannot
/// register its own event handlers since that would require the type of Event
/// to be known.
class CCBaseBlocImpl<Event, State extends CCBaseStateImpl>
    extends CCBaseBloc<Event, State> {
  CCBaseBlocImpl(super.initialState);

  @override
  void onClearError(Event event, Emitter<CCBaseStateImpl> emit) {
    log('CCBaseBlocImpl: calling onClearError');
    emit(state.copyWith(
      errorCode: '',
      errorMessage: '',
      status: CCBlocStatus.initial,
    ));
  }

  /// An event defined by this concrete implementation of [CCBaseBloc].
  ///
  /// The covariant keyword is used to modify [Event] to indicate that it can be
  /// safely widened in the inheritance hierarchy. This means that a sub class
  /// of [CCBaseBlocImpl] is allowed to use a more specific class of [Event]. On
  /// occasion, event classes are tailored to the specific event being handled
  /// and may define event parameters that need to be set. If the covariant
  /// keyword is omitted then the event handlers will be forced to cast the more
  /// generic [Event] type to its more specific form before any properties being
  /// shipped with the specific event can be accessed. This can be cumbersome
  /// and repetitive code which will also need error handling.
  void onInit(covariant Event event, Emitter<CCBaseStateImpl> emit) {
    log('CCBaseBlocImpl: calling onInit');
  }
}
