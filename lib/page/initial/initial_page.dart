import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import '../../bloc/signin/signin_bloc.dart';
import '../../bloc/signin/signin_event.dart';
import '../../i18n/label.dart';
import '../pages.dart';
import '../theme/main_theme.dart';

class InitialPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _InitialPageState();
}

class _InitialPageState extends State<InitialPage> {
  final PanelController _panelController = PanelController();
  bool _isSigninPanel;

  @override
  void initState() {
    super.initState();
    _isSigninPanel = true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SlidingUpPanel(
        minHeight: 0,
        maxHeight: _isSigninPanel ? 360 : 580,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
        color: Colors.white.withOpacity(.95),
        controller: _panelController,
        panel: _panel(),
        body: _body(context),
      ),
    );
  }

  Widget _panel() {
    return _isSigninPanel
        ? Panel(
            title: INSERT_YOUR_DATA,
            page: SigninPageConnected(),
          )
        : Panel(
            title: CREATE_ACCOUNT,
            page: SignupPageConnected(),
          );
  }

  Widget _body(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: double.maxFinite,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: ExactAssetImage('assets/images/background.jpg'),
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
              padding: const EdgeInsets.only(bottom: 60, left: 42, right: 42),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  RaisedButton(
                    child: const Text(
                      SIGNIN_WITH_EMAIL,
                      style: TextStyle(fontSize: 18),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    onPressed: () {
                      setState(() {
                        _isSigninPanel = true;
                      });
                      _panelController.open();
                    },
                  ),
                  const SizedBox(height: 8),
                  RaisedButton(
                    key: const ValueKey('google-signin-btn'),
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
                          style: const TextStyle(fontSize: 18),
                        ),
                      ],
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    color: Colors.white,
                    onPressed: () {
                      context.bloc<SigninBloc>().add(SigninWithGoogle());
                    },
                  ),
                  const SizedBox(height: 8),
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
                    onPressed: () {
                      setState(() => _isSigninPanel = false);
                      _panelController.open();
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Panel extends StatelessWidget {
  const Panel({
    @required this.title,
    @required this.page,
  }) : assert(title != null && page != null);

  final String title;
  final Widget page;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const SizedBox(height: 6),
        Container(
          width: 40,
          height: 4,
          decoration: BoxDecoration(
            color: theme.accentColor.withOpacity(.25),
            borderRadius: BorderRadius.circular(4),
          ),
        ),
        const SizedBox(height: 12),
        Text(
          title,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 16),
        Expanded(
          child: SingleChildScrollView(
            child: page,
          ),
        ),
      ],
    );
  }
}
