part of 'registration_bloc.dart';

class RegistrationEvent extends CCBaseEventImpl {
  const RegistrationEvent();
}

final class FirstNameChanged extends CCBaseEventImpl {
  const FirstNameChanged({required this.name});
  final String name;
}

final class LastNameChanged extends CCBaseEventImpl {
  const LastNameChanged({required this.name});
  final String name;
}

final class AgeChanged extends CCBaseEventImpl {
  const AgeChanged({required this.age});
  final int age;
}
