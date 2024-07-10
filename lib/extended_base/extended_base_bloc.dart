import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:example_extended_bloc/bloc_status.dart';
import 'package:example_extended_bloc/cc_base/cc_base_bloc.dart';

part 'extended_base_event.dart';
part 'extended_base_state.dart';

class ExtendedBaseBloc extends CCBaseBloc<CCBaseEvent, ExtendedBaseState> {
  ExtendedBaseBloc() : super(const ExtendedBaseInitial()) {
    on<ClearError>(onClearError);
  }

  @override
  void onClearError(
      covariant CCBaseEvent event, Emitter<ExtendedBaseState> emit) {
    print('Clearing error from widget 222222222222!!!!');
  }
}
