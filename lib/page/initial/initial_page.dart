import 'dart:ui';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:simple_router/simple_router.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import '../pages.dart';
import '../theme/main_theme.dart';
import '../../core/routing/route_names.dart';
import '../../bloc/signin/signin_bloc.dart';
import '../../bloc/signin/signin_event.dart';
import '../../i18n/label.dart';

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
    BorderRadiusGeometry radius = BorderRadius.only(
      topLeft: Radius.circular(24),
      topRight: Radius.circular(24),
    );

    return Scaffold(
      body: SlidingUpPanel(
        minHeight: 0,
        maxHeight: _isSigninPanel ? 360 : 580,
        borderRadius: radius,
        color: Colors.white.withOpacity(.95),
        controller: _panelController,
        panel: _panel(),
        body: _body(context),
      ),
    );
  }

  Widget _panel() {
    return _isSigninPanel
        ? _Panel(
            title: INSERT_YOUR_DATA,
            page: SigninPageConnected(),
          )
        : _Panel(
            title: CREATE_ACCOUNT,
            page: SignupPageConnected(),
          );
  }

  Widget _body(BuildContext context) {
    return Container(
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
                  ),
                  Container(
                    width: 240,
                    child: RaisedButton(
                      key: ValueKey('google-signin-btn'),
                      child: Row(
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
                      onPressed: () {
                        context.bloc<SigninBloc>().add(SigninWithGoogle());
                      },
                    ),
                  ),
                  Container(
                    width: 240,
                    child: OutlineButton(
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
                        setState(() {
                          _isSigninPanel = false;
                        });
                        _panelController.open();
                      },
                    ),
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

class _Panel extends StatelessWidget {
  const _Panel({
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
