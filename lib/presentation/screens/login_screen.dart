import 'package:flutter/material.dart';
import 'package:flutter_application_1/presentation/bloc/application/application_bloc.dart';
import 'package:flutter_application_1/presentation/bloc/application/application_event.dart';
import 'package:flutter_application_1/presentation/bloc/bloc.dart';
import 'package:flutter_application_1/presentation/bloc/login/login_bloc.dart';
import 'package:flutter_application_1/presentation/bloc/login/login_state.dart';
import 'package:flutter_application_1/presentation/widgets/widgets_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../injector.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _usuarioController = TextEditingController();
  final _senhaController = TextEditingController();

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
            return Container(
              alignment: AlignmentDirectional.center,
                decoration: const BoxDecoration(
                    gradient: RadialGradient(
                  colors: [Color(0xFF385ff1), Color(0xFF7414d8), Colors.white],
                  stops: [0.5, 0.8, 0.1],
                  center: Alignment(0, -0.9),
                  focal: Alignment(-0.1, -1),
                  focalRadius: 1.5,
                )),
                child: Center(
                  child: ListView(
                    children: [
                      Image(
                        height: MediaQuery.of(context).size.height * 0.25,
                        image: const AssetImage('assets/logosmart.png'),
                      ),
                      const SizedBox(
                        height: 150,
                      ),
                      const Center(
                        child:  Text(
                          "Ola!",
                          style: TextStyle(
                            color: Colors.white60,
                            fontSize: 17,
                          ),
                        ),
                      ),
                      const Center(
                        child: Text(
                          "Logue para continuar:",
                          style: TextStyle(
                            color: Colors.white60,
                            fontSize: 17,
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 16, left: 30, right: 30),
                        child: TextFormField(
                          controller: _usuarioController,
                          decoration: const InputDecoration(
                            labelText: 'Email ou Nome de usuario',
                            labelStyle: TextStyle(
                              color: Colors.white60,
                              fontSize: 17,
                            ),
                            suffixIcon: Icon(Icons.person_outline),
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 16, left: 30, right: 30),
                        child: TextFormField(
                          controller: _senhaController,
                          decoration: const InputDecoration(
                            labelText: 'Senha',
                            labelStyle: TextStyle(
                              color: Colors.white60,
                              fontSize: 17,
                            ),
                            suffixIcon: Icon(Icons.vpn_key),
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 16, left: 60, right: 60),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(40),
                            gradient: const LinearGradient(
                              colors: <Color>[
                                Color(0xFFf99587),
                                Color(0xFFf7769c),
                              ],
                            ),
                          ),
                          width: double.infinity,
                          child: TextButton(
                            onPressed: () =>
                                BlocProvider.of<LoginBloc>(context).add(
                              LoginPressedButtonEvent(
                                usuario: _usuarioController.text,
                                senha: _senhaController.text,
                              ),
                            ),
                            child: const Text(
                              'Realizar login',
                              style: TextStyle(color: Colors.white),
                            ),
                            style: ButtonStyle(
                                shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50),
                              ),
                            ),),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),);
          },
        ),
      ),
    );
  }
}
