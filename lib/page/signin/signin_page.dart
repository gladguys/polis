import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:simple_router/simple_router.dart';

import '../../bloc/blocs.dart';
import '../../bloc/signin/signin_bloc.dart';
import '../../bloc/signin/signin_state.dart';
import '../../core/routing/route_names.dart';
import '../../core/service/ad_service.dart';
import '../../core/service/locator.dart';
import '../../i18n/i18n.dart';
import '../pages.dart';
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
              context.bloc<UserBloc>().add(StoreUser(state.user));
              SimpleRouter.forwardAndReplace(
                HomePage(G<AdService>()),
                name: HOME_PAGE,
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
                              context.bloc<SigninBloc>().add(
                                  SigninWithEmailAndPassword(
                                      _email, _password));
                            }
                          },
                        ),
                        SizedBox(height: 12),
                        RaisedButton(
                          key: ValueKey('google-signin-btn'),
                          child: Text(GOOGLE),
                          onPressed: () {
                            context.bloc<SigninBloc>().add(SigninWithGoogle());
                          },
                        ),
                        SizedBox(height: 12),
                        RaisedButton(
                          child: Text(SIGNUP),
                          onPressed: () => SimpleRouter.forwardAndReplace(
                            SignupPageConnected(),
                            name: SIGNUP_PAGE,
                          ),
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
