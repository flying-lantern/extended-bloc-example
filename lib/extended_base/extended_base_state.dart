part of 'extended_base_bloc.dart';

final class ExtendedBaseState extends CCBaseState {
  const ExtendedBaseState({
    this.someVal,
    super.status = CCBlocStatus.initial,
    super.errorCode,
    super.errorMessage,
    super.blocEvent,
  });

  final String? someVal;

  @override
  List<Object?> get props => [
        someVal,
        status,
        errorCode,
        errorMessage,
        blocEvent,
      ];

  ExtendedBaseState copyWith(
          {String? someVal,
          CCBlocStatus? status,
          String? errorCode,
          String? errorMessage,
          ExtendedBaseEvent? blocEvent}) =>
      ExtendedBaseState(
        someVal: someVal ?? this.someVal,
        status: status ?? this.status,
        errorCode: errorCode ?? this.errorCode,
        errorMessage: errorMessage ?? this.errorMessage,
        blocEvent: blocEvent ?? this.blocEvent,
      );
}

final class ExtendedBaseInitial extends ExtendedBaseState {
  const ExtendedBaseInitial();
}
