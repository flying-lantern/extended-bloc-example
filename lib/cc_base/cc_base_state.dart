part of 'cc_base_bloc.dart';

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
