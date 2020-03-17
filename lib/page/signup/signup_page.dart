import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:simple_router/simple_router.dart';

import '../../bloc/blocs.dart';
import '../../core/routing/route_names.dart';
import '../../i18n/i18n.dart';
import '../../model/user_model.dart';
import '../../widget/centered_loading.dart';
import '../signin/signin_page_connected.dart';

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  SignupBloc _signupBloc;
  GlobalKey<FormState> _formKey;
  UserModel _signupUser;
  String _name;
  String _email;
  String _password;
  String _photoUrl;

  @override
  void initState() {
    super.initState();
    _signupBloc = context.bloc<SignupBloc>();
    _formKey = GlobalKey<FormState>();
    _signupUser = UserModel();
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
            if (state is UserCreated) {
              SimpleRouter.forwardAndReplace(
                SigninPageConnected(),
                name: SIGNIN_PAGE,
              );
              Get.snackbar(CONGRATULATIONS, USER_CREATED_WITH_SUCCESS);
            } else if (state is UserCreationFailed) {
              Get.snackbar(FAIL, state.statusMessage);
            } else if (state is SignupFailed) {
              Get.snackbar(FAIL, state.errorMessage);
            }
          },
          child: BlocBuilder<SignupBloc, SignupState>(
            bloc: _signupBloc,
            builder: (_, state) {
              if (state is InitialSignup ||
                  state is UserCreationFailed ||
                  state is SignupFailed) {
                return _signupForm();
              } else if (state is SignupLoading) {
                return CenteredLoading();
              }
              return CenteredLoading();
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
              key: const ValueKey('name-field'),
              decoration: const InputDecoration(
                hintText: NAME,
                border: OutlineInputBorder(),
              ),
              onSaved: (name) => _name = name,
              validator: (name) => name.isEmpty ? REQUIRED_FIELD : null,
            ),
            const SizedBox(height: 12),
            TextFormField(
              key: const ValueKey('email-field'),
              decoration: const InputDecoration(
                hintText: EMAIL,
                border: OutlineInputBorder(),
              ),
              onSaved: (email) => _email = email,
              validator: (email) => email.isEmpty ? REQUIRED_FIELD : null,
            ),
            const SizedBox(height: 12),
            TextFormField(
              key: const ValueKey('password-field'),
              decoration: const InputDecoration(
                hintText: PASSWORD,
                border: OutlineInputBorder(),
              ),
              onSaved: (password) => _password = password,
              validator: (password) => password.isEmpty ? REQUIRED_FIELD : null,
            ),
            const SizedBox(height: 12),
            TextFormField(
              key: const ValueKey('confirm-password-field'),
              decoration: const InputDecoration(
                hintText: PASSWORD_CONFIRMATION,
                border: OutlineInputBorder(),
              ),
              validator: (passwordConfirmation) =>
                  passwordConfirmation.isEmpty ? REQUIRED_FIELD : null,
            ),
            const SizedBox(height: 12),
            RaisedButton(
              key: const ValueKey('signup-btn'),
              child: const Text(SIGNUP),
              onPressed: () {
                final formState = _formKey.currentState;
                if (formState.validate()) {
                  formState.save();
                  _signupUser = UserModel(
                    name: _name,
                    email: _email,
                    password: _password,
                    photoUrl: _photoUrl,
                  );
                  _signupBloc.add(Signup(_signupUser));
                }
              },
            ),
            const SizedBox(height: 12),
            RaisedButton(
              key: const ValueKey('signin-btn'),
              child: const Text(SIGNIN),
              onPressed: () => SimpleRouter.forwardAndReplace(
                SigninPageConnected(),
                name: SIGNIN_PAGE,
              ),
            )
          ],
        ),
      ),
    );
  }
}
