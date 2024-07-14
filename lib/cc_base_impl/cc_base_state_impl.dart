part of 'cc_base_bloc_impl.dart';

/// Holds state information of [CCBaseBlocImpl].
///
/// Initializes the properties of its parent class and provides an
/// implementation of copyWith. One is free to provide any additional state
/// properties here as well.
class CCBaseStateImpl extends CCBaseState {
  const CCBaseStateImpl({
    super.errorCode,
    super.errorMessage,
    super.status = CCBlocStatus.initial,
    super.blocEvent,
  });

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
