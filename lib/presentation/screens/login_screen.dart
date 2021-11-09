import 'package:flutter/material.dart';
import 'package:flutter_application_1/presentation/bloc/application/application_bloc.dart';
import 'package:flutter_application_1/presentation/bloc/application/application_event.dart';
import 'package:flutter_application_1/presentation/bloc/bloc.dart';
import 'package:flutter_application_1/presentation/bloc/login/login_bloc.dart';
import 'package:flutter_application_1/presentation/bloc/login/login_state.dart';
import 'package:flutter_application_1/presentation/widgets/widgets_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../injector.dart';
import 'componentes/login_body.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider<LoginBloc>(
        create: (context) => getIt(),
        child: BlocBuilder<LoginBloc, LoginState>(
          builder: (context, state) {
            if (state.isSucesso) {
              BlocProvider.of<ApplicationBloc>(context).add(
                ApplicationLoginEvent(token: state.token!),
              );
            }
            if (state.isErro) {
              WidgetHelper.showError(context, state.erro!);
            }
            return LoginBody();
          },
        ),
      ),
    );
  }
}

