import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
    return BlocListener<SigninBloc, SigninState>(
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
            return _form();
          }
          if (state is SigninLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is SigninFailed) {
            return Center(
              child: Text(state.errorMessage),
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }

  Widget _form() {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: Column(
          children: <Widget>[
            const SizedBox(height: 16),
            TextFormField(
              key: const ValueKey('email-field'),
              decoration: InputDecoration(
                hintText: EMAIL,
                prefixIcon: Center(
                  widthFactor: 1,
                  child: FaIcon(
                    FontAwesomeIcons.solidUser,
                    color: Colors.black,
                  ),
                ),
              ),
              onSaved: (email) => _email = email,
              validator: (email) => email.isEmpty ? REQUIRED_FIELD : null,
            ),
            const SizedBox(height: 16),
            TextFormField(
              key: const ValueKey('password-field'),
              obscureText: true,
              decoration: InputDecoration(
                hintText: PASSWORD,
                prefixIcon: Center(
                  widthFactor: 1,
                  child: FaIcon(
                    FontAwesomeIcons.key,
                    color: Colors.black,
                  ),
                ),
              ),
              onSaved: (password) => _password = password,
              validator: (password) => password.isEmpty ? REQUIRED_FIELD : null,
            ),
            const SizedBox(height: 32),
            Container(
              width: 160,
              child: RaisedButton(
                padding: const EdgeInsets.symmetric(vertical: 10),
                key: const ValueKey('signin-btn'),
                child: const Text(
                  SIGNIN,
                  style: TextStyle(fontSize: 18),
                ),
                onPressed: () {
                  final formState = _formKey.currentState;
                  if (formState.validate()) {
                    formState.save();
                    context
                        .bloc<SigninBloc>()
                        .add(SigninWithEmailAndPassword(_email, _password));
                  }
                },
              ),
            ),
            const SizedBox(height: 8),
            Container(
              width: 160,
              child: OutlineButton(
                child: const Text(
                  RECOVERY_PASSWORD,
                  style: TextStyle(fontSize: 16),
                ),
                padding: const EdgeInsets.symmetric(vertical: 10),
                color: Colors.black,
                textColor: Colors.black,
                borderSide: BorderSide(color: Colors.black),
                highlightedBorderColor: Colors.black,
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
