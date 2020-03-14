import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:polis/page/pages.dart';
import '../../i18n/label.dart';

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
                padding: const EdgeInsets.only(bottom: 48),
                child: Wrap(
                  direction: Axis.vertical,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  spacing: 16,
                  children: <Widget>[
                    Container(
                      width: 240,
                      child: RaisedButton(
                        child: Text(
                          'Entrar com email',
                          style: TextStyle(fontSize: 18),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SigninPageConnected(),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: 240,
                      child: RaisedButton(
                        child: Row(
                          children: <Widget>[
                            const SizedBox(width: 24),
                            Image.asset(
                              'assets/images/google.png',
                              fit: BoxFit.contain,
                              height: 24,
                              width: 24,
                            ),
                            const SizedBox(width: 8),
                            Text(
                              'Entrar com Google',
                              style: TextStyle(fontSize: 18),
                            ),
                          ],
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        color: Colors.white,
                        onPressed: () {},
                      ),
                    ),
                    Container(
                      width: 240,
                      child: OutlineButton(
                        child: Text(
                          'Não tenho conta',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        color: Colors.white,
                        textColor: Colors.white,
                        borderSide: BorderSide(color: Colors.white),
                        highlightedBorderColor: Colors.white,
                        onPressed: () {},
                      ),
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
