part of 'extended_base_bloc.dart';

final class ExtendedBaseState extends CCBaseState {
  const ExtendedBaseState({
    this.extendedBaseProperty,
    super.status = CCBlocStatus.initial,
    super.errorCode,
    super.errorMessage,
    super.blocEvent,
  });

  final String? extendedBaseProperty;

  @override
  List<Object?> get props => [
        extendedBaseProperty,
        status,
        errorCode,
        errorMessage,
        blocEvent,
      ];

  ExtendedBaseState copyWith(
          {String? extendedBaseProperty,
          CCBlocStatus? status,
          String? errorCode,
          String? errorMessage,
          ExtendedBaseEvent? blocEvent}) =>
      ExtendedBaseState(
        extendedBaseProperty: extendedBaseProperty ?? this.extendedBaseProperty,
        status: status ?? this.status,
        errorCode: errorCode ?? this.errorCode,
        errorMessage: errorMessage ?? this.errorMessage,
        blocEvent: blocEvent ?? this.blocEvent,
      );
}

final class ExtendedBaseInitial extends ExtendedBaseState {
  const ExtendedBaseInitial();
}
