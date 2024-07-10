part of 'cc_base_bloc_impl.dart';

abstract class CCBaseEvent extends Equatable {
  const CCBaseEvent();

  @override
  List<Object> get props => [];
}

final class ClearError extends CCBaseEvent {
  const ClearError();
}
