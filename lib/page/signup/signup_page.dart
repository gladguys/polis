import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import '../../bloc/blocs.dart';
import '../../core/route_constants.dart';
import '../../message/message.dart';
import '../../repository/concrete/firebase/firebase_signup_repository.dart';

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  SignupBloc _signupBloc;
  GlobalKey<FormState> _formKey;
  Map<String, String> _signupUserData;

  @override
  void initState() {
    super.initState();
    _signupBloc = SignupBloc(
      repository: FirebaseSignupRepository(
          firebaseAuth: FirebaseAuth.instance, firestore: Firestore.instance),
    );
    _formKey = GlobalKey<FormState>();
    _signupUserData = {};
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
              Get.toNamed(SIGNIN_PAGE);
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
                hintText: 'Email',
                border: OutlineInputBorder(),
              ),
              onSaved: (email) => _signupUserData['email'] = email,
              validator: (email) => email.isEmpty ? 'Campo Obrigatório' : null,
            ),
            SizedBox(height: 12),
            TextFormField(
              decoration: InputDecoration(
                hintText: 'Password',
                border: OutlineInputBorder(),
              ),
              onSaved: (password) => _signupUserData['password'] = password,
              validator: (password) =>
                  password.isEmpty ? 'Campo Obrigatório' : null,
            ),
            SizedBox(height: 12),
            TextFormField(
              decoration: InputDecoration(
                hintText: 'Password Confirmation',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 12),
            RaisedButton(
              child: Text('Signup'),
              onPressed: () {
                final formState = _formKey.currentState;
                if (formState.validate()) {
                  formState.save();
                  _signupBloc.add(SignupTried(
                      _signupUserData['email'], _signupUserData['password']));
                }
              },
            ),
            SizedBox(height: 12),
            RaisedButton(
              child: Text('Signin'),
              onPressed: () => Get.toNamed(SIGNIN_PAGE),
            )
          ],
        ),
      ),
    );
  }
}
