import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_router/simple_router.dart';

import '../../../bloc/blocs.dart';
import '../../../core/validators.dart';
import '../../../i18n/i18n.dart';

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
    return Form(
      key: formKey,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: <Widget>[
            TextFormField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: EMAIL,
                labelText: EMAIL,
              ),
              validator: Validators.emailValidator,
              onSaved: (email) => signinBloc.add(SendResetPasswordEmail(email)),
            ),
            const SizedBox(height: 18),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                RaisedButton(
                  onPressed: () {
                    final form = formKey.currentState;
                    if (form.validate()) {
                      form.save();
                      SimpleRouter.back();
                    }
                  },
                  child: Text(SEND),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
