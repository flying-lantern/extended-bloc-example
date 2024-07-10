part of 'cc_base_bloc_impl.dart';

class CCBaseState extends Equatable {
  const CCBaseState({
    this.errorCode,
    this.errorMessage,
    this.status = CCBlocStatus.initial,
    this.blocEvent,
  });

  final String? errorCode;
  final String? errorMessage;
  final CCBlocStatus status;
  final CCBaseEvent? blocEvent;

  @override
  List<Object?> get props => [
        errorCode,
        errorMessage,
        status,
        blocEvent,
      ];

  CCBaseState copyWith({
    String? errorCode,
    String? errorMessage,
    CCBlocStatus? status,
    CCBaseEvent? blocEvent,
  }) =>
      CCBaseState(
        errorCode: errorCode ?? this.errorCode,
        errorMessage: errorMessage ?? this.errorMessage,
        status: status ?? this.status,
        blocEvent: blocEvent ?? this.blocEvent,
      );
}

final class CCBaseInitial extends CCBaseState {
  const CCBaseInitial();
}
