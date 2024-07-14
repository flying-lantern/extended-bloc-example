part of 'cc_base_bloc.dart';

/// The super class for all other events.
abstract class CCBaseEvent extends Equatable {
  const CCBaseEvent();

  @override
  List<Object> get props => [];
}

/// The event to be used by concrete implementations of the ClearError event
/// handler.
final class ClearError extends CCBaseEvent {
  const ClearError();
}
