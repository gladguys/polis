import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_router/simple_router.dart';

import '../../../bloc/blocs.dart';
import '../../../core/i18n/i18n.dart';
import '../../../core/validators.dart';

class ResetPasswordForm extends StatefulWidget {
  @override
  _ResetPasswordFormState createState() => _ResetPasswordFormState();
}

class _ResetPasswordFormState extends State<ResetPasswordForm> {
  SigninBloc signinBloc;
  GlobalKey<FormState> formKey;

  @override
  void initState() {
    signinBloc = context.bloc<SigninBloc>();
    formKey = GlobalKey<FormState>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: formKey,
        child: Container(
          width: 320,
          child: Column(
            children: <Widget>[
              const Text(
                RECOVER_YOUR_PASSWORD,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 24),
              TextFormField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: EMAIL,
                ),
                keyboardType: TextInputType.emailAddress,
                validator: Validators.emailValidator,
                onSaved: (email) =>
                    signinBloc.add(SendResetPasswordEmail(email)),
              ),
              const SizedBox(height: 32),
              Container(
                width: 160,
                child: RaisedButton(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  onPressed: () {
                    final form = formKey.currentState;
                    if (form.validate()) {
                      form.save();
                      SimpleRouter.back();
                    }
                  },
                  child: const Text(
                    CONFIRM,
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
