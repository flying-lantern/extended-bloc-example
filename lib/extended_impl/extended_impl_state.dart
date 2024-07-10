part of 'extended_impl_bloc.dart';

final class ExtendedImplState extends CCBaseStateImpl {
  const ExtendedImplState({
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
  ExtendedImplState copyWith({
    String? extendedProperty,
    CCBlocStatus? status,
    String? errorCode,
    String? errorMessage,
    CCBaseEventImpl? blocEvent,
  }) =>
      ExtendedImplState(
        extendedProperty: extendedProperty ?? this.extendedProperty,
        status: status ?? this.status,
        errorCode: errorCode ?? this.errorCode,
        errorMessage: errorMessage ?? this.errorMessage,
        blocEvent: blocEvent ?? this.blocEvent,
      );
}

final class ExtendedInitial extends ExtendedImplState {}
