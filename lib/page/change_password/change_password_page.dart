import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/blocs.dart';
import '../../core/i18n/i18n.dart';
import '../../core/keys.dart';
import '../../widget/loading.dart';
import '../../widget/snackbar.dart';
import '../../widget/text_title.dart';

class ChangePasswordPage extends StatefulWidget {
  @override
  _ChangePasswordPageState createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  GlobalKey<FormState> _formKey;
  String _currentPassword;
  String _newPassword;

  ChangePasswordBloc get changePasswordBloc =>
      context.bloc<ChangePasswordBloc>();

  @override
  void initState() {
    _formKey = GlobalKey<FormState>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocConsumer<ChangePasswordBloc, ChangePasswordState>(
            listener: (_, state) {
          if (state is UserPasswordChangeSuccess) {
            Snackbar.success(_, USER_PASSWORD_UPDATED_WITH_SUCCESS);
          }
          if (state is UserPasswordChangeFailed) {
            Snackbar.error(_, USER_UPDATE_PASSWORD_FAILED);
          }
          if (state is UserWrongPasswordInformed) {
            Snackbar.error(_, USER_UPDATE_PASSWORD_WRONG_PASSWORD);
          }
        }, builder: (_, state) {
          if (state is UserPasswordChanging) {
            return const Loading();
          } else {
            return Column(
              children: <Widget>[
                const SizedBox(height: 12),
                Center(
                  child: TextTitle(CHANGE_YOUR_PROFILE),
                ),
                const SizedBox(height: 22),
                Padding(
                  padding: const EdgeInsets.all(32),
                  child: _getForm(),
                ),
                const SizedBox(height: 16),
                Container(
                  height: 40,
                  width: 160,
                  child: FlatButton(
                    padding: EdgeInsets.zero,
                    child: const Text(CONFIRM),
                    color: Colors.amber,
                    onPressed: () {
                      final formState = _formKey.currentState;
                      if (formState.validate()) {
                        formState.save();
                        changePasswordBloc.add(
                          ChangeUserPassword(
                            currentPassword: _currentPassword,
                            newPassword: _newPassword,
                          ),
                        );
                      }
                    },
                  ),
                ),
              ],
            );
          }
        }),
      ),
    );
  }

  Widget _getForm() {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          TextFormField(
            key: currentPasswordFieldKey,
            decoration: const InputDecoration(
              labelText: CURRENT_PASSWORD,
            ),
            obscureText: true,
            textInputAction: TextInputAction.next,
            onSaved: (currentPassword) => _currentPassword = currentPassword,
            validator: (currentPassword) {
              if (currentPassword.isEmpty) {
                return REQUIRED_FIELD;
              } else if (currentPassword.length < 6) {
                return MIN_PASSWORD_LENGTH;
              }
              return null;
            },
          ),
          const SizedBox(height: 12),
          TextFormField(
            key: newPasswordFieldKey,
            decoration: const InputDecoration(
              labelText: NEW_PASSWORD,
            ),
            obscureText: true,
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.emailAddress,
            onChanged: (newPassword) => _newPassword = newPassword,
            validator: (newPassword) {
              if (newPassword.isEmpty) {
                return REQUIRED_FIELD;
              } else if (newPassword.length < 6) {
                return MIN_PASSWORD_LENGTH;
              }
              return null;
            },
          ),
          const SizedBox(height: 12),
          TextFormField(
            key: newPasswordConfirmationFieldKey,
            decoration: const InputDecoration(
              labelText: NEW_PASSWORD_CONFIRMATION,
            ),
            obscureText: true,
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.emailAddress,
            validator: (passwordConfirmation) {
              if (passwordConfirmation.isEmpty) {
                return REQUIRED_FIELD;
              } else if (passwordConfirmation.length < 6) {
                return MIN_PASSWORD_LENGTH;
              }
              return _newPassword != passwordConfirmation
                  ? PASSWORD_AND_CONFIRMATION_DONT_MATCH
                  : null;
            },
          ),
        ],
      ),
    );
  }
}
