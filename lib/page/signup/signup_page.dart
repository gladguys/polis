import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import '../../bloc/blocs.dart';
import '../../i18n/i18n.dart';
import '../../model/user_model.dart';
import '../../repository/concrete/firebase/firebase_signup_repository.dart';
import '../pages.dart';

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
    _signupBloc = SignupBloc(
      repository: FirebaseSignupRepository(
        firebaseAuth: FirebaseAuth.instance,
        firestore: Firestore.instance,
      ),
    );
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
              Get.to(SigninPage());
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
                hintText: NAME,
                border: OutlineInputBorder(),
              ),
              onSaved: (name) => _name = name,
              validator: (name) => name.isEmpty ? REQUIRED_FIELD : null,
            ),
            SizedBox(height: 12),
            TextFormField(
              decoration: InputDecoration(
                hintText: EMAIL,
                border: OutlineInputBorder(),
              ),
              onSaved: (email) => _email = email,
              validator: (email) => email.isEmpty ? REQUIRED_FIELD : null,
            ),
            SizedBox(height: 12),
            TextFormField(
              decoration: InputDecoration(
                hintText: PASSWORD,
                border: OutlineInputBorder(),
              ),
              onSaved: (password) => _password = password,
              validator: (password) => password.isEmpty ? REQUIRED_FIELD : null,
            ),
            SizedBox(height: 12),
            TextFormField(
              decoration: InputDecoration(
                hintText: PASSWORD_CONFIRMATION,
                border: OutlineInputBorder(),
              ),
              validator: (passwordConfirmation) =>
                  passwordConfirmation.isEmpty ? REQUIRED_FIELD : null,
            ),
            SizedBox(height: 12),
            RaisedButton(
              child: Text('Signup'),
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
            SizedBox(height: 12),
            RaisedButton(
              child: Text(SIGNUP),
              onPressed: () => Get.to(SignupPage()),
            )
          ],
        ),
      ),
    );
  }
}
