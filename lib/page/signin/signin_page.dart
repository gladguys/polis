import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import '../../bloc/blocs.dart';
import '../../bloc/signin/signin_bloc.dart';
import '../../bloc/signin/signin_state.dart';
import '../../i18n/i18n.dart';
import '../../repository/concrete/firebase/firebase_user_repository.dart';
import '../home/home_page.dart';
import '../signup/signup_page_connected.dart';

class SigninPage extends StatefulWidget {
  @override
  _SigninPageState createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage> {
  GlobalKey<FormState> _formKey;
  String _email;
  String _password;

  @override
  void initState() {
    super.initState();
    _formKey = GlobalKey<FormState>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: BlocListener<SigninBloc, SigninState>(
          listener: (context, state) {
            if (state is UserAuthenticated) {
              Get.off(
                BlocProvider<UserBloc>(
                  create: (_) => UserBloc(
                    user: state.user,
                    repository: FirebaseUserRepository(
                        firebaseAuth: FirebaseAuth.instance),
                  ),
                  child: HomePage(),
                ),
              );
            }
            if (state is SigninFailed) {
              Get.snackbar('1qqq', state.errorMessage);
            }
          },
          child: BlocBuilder<SigninBloc, SigninState>(
            builder: (_, state) {
              if (state is InitialSignin) {
                return Form(
                  key: _formKey,
                  child: Padding(
                    padding: const EdgeInsets.all(14),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        TextFormField(
                          key: ValueKey('email-field'),
                          decoration: InputDecoration(
                            hintText: EMAIL,
                            border: OutlineInputBorder(),
                          ),
                          onSaved: (email) => _email = email,
                          validator: (email) =>
                              email.isEmpty ? REQUIRED_FIELD : null,
                        ),
                        SizedBox(height: 12),
                        TextFormField(
                          key: ValueKey('password-field'),
                          decoration: InputDecoration(
                            hintText: PASSWORD,
                            border: OutlineInputBorder(),
                          ),
                          onSaved: (password) => _password = password,
                          validator: (password) =>
                              password.isEmpty ? REQUIRED_FIELD : null,
                        ),
                        SizedBox(height: 12),
                        RaisedButton(
                          key: ValueKey('signin-btn'),
                          child: Text(SIGNIN),
                          onPressed: () {
                            final formState = _formKey.currentState;
                            if (formState.validate()) {
                              formState.save();
                              BlocProvider.of<SigninBloc>(context)
                                  .add(Signin(_email, _password));
                            }
                          },
                        ),
                        SizedBox(height: 12),
                        RaisedButton(
                          child: Text('Google'),
                          onPressed: () {
                            BlocProvider.of<SigninBloc>(context)
                                .add(SigninWithGoogle());
                          },
                        ),
                        SizedBox(height: 12),
                        RaisedButton(
                          child: Text(SIGNUP),
                          onPressed: () => Get.to(SignupPageConnected()),
                        ),
                      ],
                    ),
                  ),
                );
              }
              if (state is SigninFailed) {
                return Center(
                  child: Text(state.errorMessage),
                );
              }
              return SizedBox.shrink();
            },
          ),
        ),
      ),
    );
  }
}
