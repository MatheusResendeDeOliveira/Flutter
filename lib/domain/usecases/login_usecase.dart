import 'package:dartz/dartz.dart';
import 'package:flutter_application_1/domain/entites/login.dart';
import 'package:flutter_application_1/domain/erros/failure.dart';
import 'package:flutter_application_1/domain/services/login_service.dart';

class LoginUsecase {
  final LoginService loginService;

  LoginUsecase({required this.loginService});

  Future<Either<Failure, Login>> realizeLogin(
      {required String usuario, required String senha}) async {
    if (usuario.isEmpty || senha.isEmpty) {
      return Left(ErrorLogin(mensagem: 'Informe login e senha'));
    }

    try {
      var login =
          await loginService.obtenhaLogin(usuario: usuario, senha: senha);
      return Right(login);
    } catch (erro) {
      return left(ErrorLogin(mensagem: erro.toString()));
    }
  }
}
