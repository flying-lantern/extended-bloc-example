part of 'registration_bloc.dart';

class RegistrationEvent extends CCBaseEventImpl {
  const RegistrationEvent();
}

final class Init extends RegistrationEvent {
  const Init({required this.initialValue});
  final String initialValue;
}

final class FirstNameChanged extends RegistrationEvent {
  const FirstNameChanged({required this.name});
  final String name;
}

final class LastNameChanged extends RegistrationEvent {
  const LastNameChanged({required this.name});
  final String name;
}

final class AgeChanged extends RegistrationEvent {
  const AgeChanged({required this.age});
  final int age;
}
