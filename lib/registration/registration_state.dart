part of 'registration_bloc.dart';

final class RegistrationState extends CCBaseStateImpl {
  const RegistrationState({
    super.errorCode,
    super.errorMessage,
    super.status = CCBlocStatus.initial,
    super.blocEvent,
    this.fName,
    this.lName,
    this.age,
  });

  final String? fName;
  final String? lName;
  final int? age;

  @override
  List<Object?> get props => [
        ...super.props,
        fName,
        lName,
        age,
      ];

  @override
  RegistrationState copyWith({
    String? errorCode,
    String? errorMessage,
    CCBlocStatus? status,
    CCBaseEventImpl? blocEvent,
    String? fName,
    String? lName,
    int? age,
  }) =>
      RegistrationState(
        errorCode: errorCode ?? this.errorCode,
        errorMessage: errorMessage ?? this.errorMessage,
        status: status ?? this.status,
        blocEvent: blocEvent ?? this.blocEvent,
        fName: fName ?? this.fName,
        lName: lName ?? this.lName,
        age: age ?? this.age,
      );
}

final class RegistrationInitial extends RegistrationState {}
