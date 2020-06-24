import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:simple_router/simple_router.dart';

import '../../bloc/blocs.dart';
import '../../bloc/commom_bloc.dart';
import '../../bloc/signin/signin_bloc.dart';
import '../../core/i18n/i18n.dart';
import '../../core/keys.dart';
import '../../core/routing/route_names.dart';
import '../../core/service/locator.dart';
import '../../core/service/services.dart';
import '../../core/validators.dart';
import '../../widget/loading.dart';
import '../../widget/snackbar.dart';
import '../pages.dart';
import 'widget/reset_password_form.dart';

class SigninPage extends StatefulWidget {
  @override
  _SigninPageState createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage> {
  GlobalKey<FormState> _formKey;
  String _email;
  String _password;
  FocusNode _passwordFN;

  SigninBloc get signinBloc => context.bloc<SigninBloc>();

  @override
  void initState() {
    super.initState();
    _formKey = GlobalKey<FormState>();
    _passwordFN = FocusNode();
  }

  @override
  void dispose() {
    _passwordFN.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<SigninBloc, SigninState>(
      listener: (context, state) {
        state.maybeWhen(
          userAuthenticated: (user) {
            context.bloc<UserBloc>().add(StoreUser(user));

            if (user.isFirstLoginDone) {
              SimpleRouter.forwardAndReplace(
                TimelinePageConnected(
                  appUpdateService: G<AppUpdateService>(),
                ),
                name: TIMELINE_PAGE,
              );
            } else {
              SimpleRouter.forwardAndReplace(
                PickStatePage(),
                name: PICK_STATE_PAGE,
              );
            }
          },
          signinFailed: (errorMessage) => Snackbar.error(context, errorMessage),
          userAuthenticationFailed: (_) =>
              Snackbar.error(context, ERROR_AUTENTICATING_USER),
          resetEmailSentSuccess: () =>
              Snackbar.success(context, EMAIL_RESET_SEND),
          resetEmailSentFailed: () =>
              Snackbar.success(context, ERROR_SENTING_RESET_PASSWORD_EMAIL),
          orElse: () {},
        );
      },
      child: BlocBuilder<SigninBloc, SigninState>(
        builder: (_, state) => state.map(
          initial: _mapStateToWidget,
          signinLoading: (state) => const Center(
            child: Padding(
              padding: EdgeInsets.only(top: 72),
              child: Loading(),
            ),
          ),
          sentingResetEmail: (state) => const Center(
            child: Padding(
              padding: EdgeInsets.only(top: 72),
              child: CircularProgressIndicator(),
            ),
          ),
          userAuthenticated: (state) => const SizedBox.shrink(),
          userAuthenticationFailed: _mapStateToWidget,
          signinFailed: _mapStateToWidget,
          resetEmailSentSuccess: _mapStateToWidget,
          resetEmailSentFailed: mapErrorStateToWidget,
        ),
      ),
    );
  }

  Widget _mapStateToWidget(state) {
    void _validateAndSendForm() {
      final formState = _formKey.currentState;
      if (formState.validate()) {
        formState.save();
        signinBloc.add(SigninWithEmailAndPassword(_email, _password));
      }
    }

    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: Column(
          children: <Widget>[
            const SizedBox(height: 16),
            TextFormField(
              key: emailFieldKey,
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
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.emailAddress,
              onEditingComplete: () => _passwordFN.requestFocus(),
              onSaved: (email) => _email = email,
              validator: Validators.emailValidator,
            ),
            const SizedBox(height: 16),
            TextFormField(
              key: passwordFieldKey,
              focusNode: _passwordFN,
              obscureText: true,
              onEditingComplete: _validateAndSendForm,
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
                key: signinBtnKey,
                child: const Text(
                  SIGNIN,
                  style: TextStyle(fontSize: 18),
                ),
                onPressed: _validateAndSendForm,
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
                borderSide: const BorderSide(color: Colors.black),
                highlightedBorderColor: Colors.black,
                onPressed: () => {
                  showDialog(
                    context: context,
                    builder: (_) => BlocProvider.value(
                      value: signinBloc,
                      child: AlertDialog(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24),
                        ),
                        content: ResetPasswordForm(),
                      ),
                    ),
                  )
                },
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
