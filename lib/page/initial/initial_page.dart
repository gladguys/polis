import 'dart:ui';

import 'package:flutter/material.dart';

import '../../i18n/label.dart';
import '../pages.dart';

class InitialPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: const ExactAssetImage('assets/images/background.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: <Color>[
                Colors.black,
                Colors.black.withOpacity(.6),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 96),
                child: Text(
                  POLIS,
                  style: TextStyle(
                    fontFamily: 'Philosopher',
                    fontSize: 72,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 48, left: 42, right: 42),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    RaisedButton(
                      child: Text(
                        SIGNIN_WITH_EMAIL,
                        style: TextStyle(fontSize: 18),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SigninPageConnected(),
                        ),
                      ),
                    ),
                    SizedBox(height: 12),
                    RaisedButton(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          const SizedBox(width: 24),
                          Image.asset(
                            'assets/images/google.png',
                            fit: BoxFit.contain,
                            height: 20,
                            width: 20,
                          ),
                          const SizedBox(width: 8),
                          Text(
                            SIGNIN_WITH_GOOGLE,
                            style: TextStyle(fontSize: 18),
                          ),
                        ],
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      color: Colors.white,
                      onPressed: () {},
                    ),
                    SizedBox(height: 12),
                    OutlineButton(
                      child: Text(
                        NO_ACCOUNT,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      color: Colors.white,
                      textColor: Colors.white,
                      borderSide: BorderSide(color: Colors.white),
                      highlightedBorderColor: Colors.white,
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
