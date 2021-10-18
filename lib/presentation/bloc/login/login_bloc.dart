import 'package:dartz/dartz.dart';
import 'package:flutter_application_1/domain/entites/login.dart';
import 'package:flutter_application_1/domain/erros/failure.dart';
import 'package:flutter_application_1/domain/usecases/login_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'login_event.dart';
import 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginUsecase loginUsecase;

  LoginBloc({required this.loginUsecase}) : super(LoginState.inicializando());

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is LoginPressedButtonEvent) {
      yield LoginState.carregando();

      Either<Failure, Login> result = await loginUsecase.realizeLogin(
          usuario: event.usuario, senha: event.senha);

      yield result.fold((failure) => LoginState.erro(failure.mensagem),
          (sucess) => LoginState.sucesso(sucess.token));

      //enviar o usário e senha pra api e aguardar o retorno login
    }
  }
}
