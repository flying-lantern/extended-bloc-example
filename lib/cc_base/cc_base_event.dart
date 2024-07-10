part of 'cc_base_bloc.dart';

abstract class CCBaseEvent extends Equatable {
  const CCBaseEvent();

  @override
  List<Object> get props => [];
}

final class ClearError extends CCBaseEvent {
  const ClearError();
}
