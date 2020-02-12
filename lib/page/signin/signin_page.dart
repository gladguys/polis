import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../bloc/blocs.dart';
import '../../bloc/signin/signin_bloc.dart';
import '../../bloc/signin/signin_state.dart';
import '../../core/route_constants.dart';
import '../../repository/concrete/firebase/firebase_signin_repository.dart';

const GOOGLE_SIGNIN_SCOPE = 'email';
const GOOGLE_SIGNIN_URL = 'https://www.googleapis.com/auth/contacts.readonly';

class SigninPage extends StatefulWidget {
  @override
  _SigninPageState createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage> {
  SigninBloc _signinBloc;
  GlobalKey<FormState> formKey;
  TextEditingController email = TextEditingController();
  TextEditingController senha = TextEditingController();

  @override
  void initState() {
    super.initState();
    _signinBloc = SigninBloc(
      repository: FirebaseSigninRepository(
        firebaseAuth: FirebaseAuth.instance,
        googleSignIn: GoogleSignIn(
          scopes: [GOOGLE_SIGNIN_SCOPE, GOOGLE_SIGNIN_URL],
        ),
      ),
    );
    formKey = GlobalKey<FormState>();
  }

  @override
  void dispose() {
    super.dispose();
    _signinBloc.close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: BlocBuilder<SigninBloc, SigninState>(
          bloc: _signinBloc,
          builder: (_, state) {
            if (state is InitialSignin) {
              return _signinForm();
            }
            return CircularProgressIndicator();
          },
        ),
      ),
    );
  }

  Widget _signinForm() {
    return Form(
      key: formKey,
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
              controller: email,
            ),
            SizedBox(height: 12),
            TextFormField(
              decoration: InputDecoration(
                hintText: 'Password',
                border: OutlineInputBorder(),
              ),
              controller: senha,
            ),
            SizedBox(height: 12),
            RaisedButton(
              child: Text('Login'),
              onPressed: () => _signinBloc.add(SigninTried('', '')),
            ),
            SizedBox(height: 12),
            RaisedButton(
              child: Text('Signup'),
              onPressed: () {
                Get.toNamed(SIGNUP_PAGE);
              },
            ),
            SizedBox(height: 12),
            RaisedButton(
              child: Text('Signin com Google'),
              onPressed: () => _signinBloc.add(SigninWithGoogle()),
            )
          ],
        ),
      ),
    );
  }
}
