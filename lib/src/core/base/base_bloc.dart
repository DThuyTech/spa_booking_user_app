import 'package:flutter_bloc/flutter_bloc.dart';

/// Base BLoC coordinating events and states.
abstract class BaseBloc<Event, State> extends Bloc<Event, State> {
  BaseBloc(super.initialState);
}
