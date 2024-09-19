import 'package:flutter_bloc/flutter_bloc.dart';

abstract class AppBloc<E, S> extends Bloc<E, S> {
  AppBloc(S initialState) : super(initialState);

  void handleUiEvent(E event) => add(event);
}
