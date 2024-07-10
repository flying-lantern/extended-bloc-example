part of 'extended_bloc.dart';

final class ExtendedState extends CCBaseState {
  const ExtendedState({
    this.extendedProperty,
    super.status,
    super.errorCode,
    super.errorMessage,
    super.blocEvent,
  });

  final String? extendedProperty;

  @override
  List<Object?> get props => [
        ...super.props,
        extendedProperty,
      ];

  @override
  ExtendedState copyWith({
    String? extendedProperty,
    CCBlocStatus? status,
    String? errorCode,
    String? errorMessage,
    CCBaseEvent? blocEvent,
  }) =>
      ExtendedState(
        extendedProperty: extendedProperty ?? this.extendedProperty,
        status: status ?? this.status,
        errorCode: errorCode ?? this.errorCode,
        errorMessage: errorMessage ?? this.errorMessage,
        blocEvent: blocEvent ?? this.blocEvent,
      );
}

final class ExtendedInitial extends ExtendedState {}
