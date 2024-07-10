part of 'cc_base_bloc_impl.dart';

class CCBaseStateImpl extends Equatable {
  const CCBaseStateImpl({
    this.errorCode,
    this.errorMessage,
    this.status = CCBlocStatus.initial,
    this.blocEvent,
  });

  final String? errorCode;
  final String? errorMessage;
  final CCBlocStatus status;
  final CCBaseEventImpl? blocEvent;

  @override
  List<Object?> get props => [
        errorCode,
        errorMessage,
        status,
        blocEvent,
      ];

  CCBaseStateImpl copyWith({
    String? errorCode,
    String? errorMessage,
    CCBlocStatus? status,
    CCBaseEventImpl? blocEvent,
  }) =>
      CCBaseStateImpl(
        errorCode: errorCode ?? this.errorCode,
        errorMessage: errorMessage ?? this.errorMessage,
        status: status ?? this.status,
        blocEvent: blocEvent ?? this.blocEvent,
      );
}

final class CCBaseInitial extends CCBaseStateImpl {
  const CCBaseInitial();
}
