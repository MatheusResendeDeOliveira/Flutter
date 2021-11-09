import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc.dart';

class ApplicationBloc extends Bloc<ApplicationEvent, ApplicationState> {
  ApplicationBloc(ApplicationState initialState) : super(initialState);

  static String _token = "";

  @override
  Stream<ApplicationState> mapEventToState(ApplicationEvent event) async* {
    if (event is ApplicationStartEvent) {
      if (_token.isEmpty) {
        yield ApplicationState.desautenticado();
      } else {
        yield ApplicationState.autenticado();
      }
    }
    if (event is ApplicationLoginEvent) {
      _token = event.token;
      yield ApplicationState.autenticado();
    }
  }
}
