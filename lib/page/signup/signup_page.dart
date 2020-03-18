import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:simple_router/simple_router.dart';

import '../../bloc/blocs.dart';
import '../../core/routing/route_names.dart';
import '../../i18n/i18n.dart';
import '../../model/user_model.dart';
import '../initial/initial_page_connected.dart';
import '../theme/main_theme.dart';

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
    return BlocListener(
      bloc: _signupBloc,
      listener: (context, state) {
        if (state is UserCreated) {
          SimpleRouter.forwardAndReplace(
            InitialPageConnected(),
            name: INITIAL_PAGE,
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
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return const CircularProgressIndicator();
        },
      ),
    );
  }

  Widget _signupForm() {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: Column(
          children: <Widget>[
            Center(
              child: FaIcon(
                FontAwesomeIcons.solidUserCircle,
                color: theme.accentColor.withOpacity(.6),
                size: 120,
              ),
            ),
            const SizedBox(height: 16),
            TextFormField(
              key: const ValueKey('name-field'),
              decoration: const InputDecoration(
                labelText: NAME,
              ),
              onSaved: (name) => _name = name,
              validator: (name) => name.isEmpty ? REQUIRED_FIELD : null,
            ),
            const SizedBox(height: 16),
            TextFormField(
              key: const ValueKey('email-field'),
              decoration: const InputDecoration(
                labelText: EMAIL,
              ),
              onSaved: (email) => _email = email,
              validator: (email) => email.isEmpty ? REQUIRED_FIELD : null,
            ),
            const SizedBox(height: 16),
            TextFormField(
              key: const ValueKey('password-field'),
              obscureText: true,
              decoration: const InputDecoration(
                labelText: PASSWORD,
              ),
              onSaved: (password) => _password = password,
              validator: (password) => password.isEmpty ? REQUIRED_FIELD : null,
            ),
            const SizedBox(height: 16),
            TextFormField(
              key: const ValueKey('confirm-password-field'),
              obscureText: true,
              decoration: const InputDecoration(
                labelText: PASSWORD_CONFIRMATION,
              ),
              validator: (passwordConfirmation) =>
                  passwordConfirmation.isEmpty ? REQUIRED_FIELD : null,
            ),
            const SizedBox(height: 32),
            Container(
              width: 160,
              child: RaisedButton(
                key: const ValueKey('signup-btn'),
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: const Text(
                  SIGNUP,
                  style: TextStyle(fontSize: 18),
                ),
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
            ),
          ],
        ),
      ),
    );
  }
}
