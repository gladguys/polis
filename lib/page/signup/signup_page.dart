import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:polis/bloc/blocs.dart';
import 'package:polis/core/route_constants.dart';
import 'package:polis/message/message.dart';
import 'package:polis/repository/concrete/firebase/firebase_signup_repository.dart';

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  SignupBloc _signupBloc;
  GlobalKey<FormState> _formKey;
  Map<String, String> _signupUserData;

  @override
  void initState() {
    super.initState();
    _signupBloc =
        SignupBloc(repository: FirebaseSignupRepository(FirebaseAuth.instance));
    _formKey = GlobalKey<FormState>();
    _signupUserData = {};
  }

  @override
  void dispose() {
    super.dispose();
    _signupBloc.close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: BlocListener(
          bloc: _signupBloc,
          listener: (context, state) {
            if (state is UserCreatedState) {
              Get.toNamed(SIGNIN_PAGE);
              Get.snackbar(PARABENS, USUARIO_CRIADO_COM_SUCESSO);
            } else if (state is UserCreationFailedState) {
              Get.snackbar(FALHA, state.statusMessage);
            } else if (state is SignupFailedState) {
              Get.snackbar(FALHA, state.errorMessage);
            }
          },
          child: BlocBuilder<SignupBloc, SignupState>(
            bloc: _signupBloc,
            builder: (_, state) {
              if (state is InitialSignupState ||
                  state is UserCreationFailedState ||
                  state is SignupFailedState) {
                return _signupForm();
              } else if (state is SignupLoadingState) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              return CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }

  Widget _signupForm() {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextFormField(
              decoration: InputDecoration(
                hintText: 'Email',
                border: OutlineInputBorder(),
              ),
              onSaved: (email) => _signupUserData['email'] = email,
              validator: (email) => email.isEmpty ? 'Campo Obrigatório' : null,
            ),
            SizedBox(height: 12),
            TextFormField(
              decoration: InputDecoration(
                hintText: 'Password',
                border: OutlineInputBorder(),
              ),
              onSaved: (password) => _signupUserData['password'] = password,
              validator: (password) =>
                  password.isEmpty ? 'Campo Obrigatório' : null,
            ),
            SizedBox(height: 12),
            TextFormField(
              decoration: InputDecoration(
                hintText: 'Password Confirmation',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 12),
            RaisedButton(
              child: Text('Signup'),
              onPressed: () {
                final formState = _formKey.currentState;
                if (formState.validate()) {
                  formState.save();
                  _signupBloc.add(SignupTriedEvent(
                      _signupUserData['email'], _signupUserData['password']));
                }
              },
            ),
            SizedBox(height: 12),
            RaisedButton(
              child: Text('Signin'),
              onPressed: () => Get.toNamed(SIGNIN_PAGE),
            )
          ],
        ),
      ),
    );
  }
}
