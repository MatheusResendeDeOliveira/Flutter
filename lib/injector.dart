import 'package:flutter_application_1/domain/services/login_service.dart';
import 'package:flutter_application_1/domain/usecases/login_usecase.dart';
import 'package:flutter_application_1/presentation/bloc/bloc.dart';
import 'package:get_it/get_it.dart';

import 'data/services/login_service_impl.dart';

final getIt = GetIt.instance;
Future<void> init() async {
  getIt.registerFactory(() => LoginBloc(loginUsecase: getIt()));
  getIt.registerFactory(() => LoginUsecase(loginService: getIt()));

  getIt.registerFactory<LoginService>(() => LoginServiceImpl());
}
