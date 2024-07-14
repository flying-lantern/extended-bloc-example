part of 'cc_base_bloc.dart';

/// The base state class that should be inherited by all child state blocs.
///
/// The purpose of this class is to contain all the state properties that every
/// sub bloc should inherit. If all child blocs carry around this state then
/// generic methods/widgets only concerned with the properties defined here may
/// be crafted to accept any such sub bloc.
abstract class CCBaseState extends Equatable {
  const CCBaseState({
    required this.status,
    required this.errorCode,
    required this.errorMessage,
    required this.blocEvent,
  });

  final CCBlocStatus status;
  final String? errorCode;
  final String? errorMessage;
  final CCBaseEvent? blocEvent;
}
