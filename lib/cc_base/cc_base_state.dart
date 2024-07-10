part of 'cc_base_bloc.dart';

abstract class CCBaseState extends Equatable {
  const CCBaseState({
    required this.status,
    required this.errorCode,
    required this.errorMessage,
  });

  final CCBlocStatus status;
  final String? errorCode;
  final String? errorMessage;
}
