part of 'cc_base_bloc_impl.dart';

class CCBaseEventImpl extends CCBaseEvent {
  const CCBaseEventImpl();

  @override
  List<Object> get props => [];
}

final class SomeEvent extends CCBaseEventImpl {
  const SomeEvent();
}
