import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_router/simple_router.dart';
import 'package:sliding_panel/sliding_panel.dart';

import '../../bloc/cubits.dart';
import '../../core/i18n/i18n.dart';
import '../../core/keys.dart';
import '../../core/routing/route_names.dart';
import '../../core/service/locator.dart';
import '../../core/service/services.dart';
import '../../widget/loading.dart';
import '../../widget/snackbar.dart';
import '../intro/polis_info_page.dart';
import '../pages.dart';
import 'widget/panel.dart';

class InitialPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _InitialPageState();
}

class _InitialPageState extends State<InitialPage> {
  PanelController _panelController;
  bool _isSigninPanel = false;
  double _expandedHeight = 0.55;

  SigninCubit get signinCubit => context.bloc<SigninCubit>();

  @override
  void initState() {
    _panelController = PanelController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<SigninCubit, SigninState>(
        listener: (_, state) {
          if (state is UserAuthenticated) {
            final user = state.user;
            context.bloc<UserCubit>().storeUser(user);
            context.bloc<UserCubit>().setUserPickedTheme(user);
            if (user.isFirstLoginDone) {
              SimpleRouter.forwardAndReplace(
                TimelinePageConnected(
                  appUpdateService: G<AppUpdateService>(),
                ),
                name: TIMELINE_PAGE,
              );
            } else {
              SimpleRouter.forwardAndReplace(
                PolisInfoPage(),
                name: POLIS_INFO_PAGE,
              );
            }
          }
          if (state is SigninFailed) {
            Snackbar.error(context, state.errorMessage);
          }
          if (state is UserAuthenticationFailed) {
            Snackbar.error(context, ERROR_AUTENTICATING_USER);
          }
        },
        builder: (_, state) {
          if (state is SigninLoading || state is UserAuthenticated) {
            return const Loading();
          } else {
            return SlidingPanel(
              panelController: _panelController,
              backPressBehavior: BackPressBehavior.CLOSE_PERSIST,
              snapping: PanelSnapping.enabled,
              decoration: PanelDecoration(
                backgroundColor: Colors.white.withOpacity(.95),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(24),
                  topRight: Radius.circular(24),
                ),
              ),
              size: PanelSize(
                closedHeight: 0,
                collapsedHeight: 0,
                expandedHeight: _expandedHeight,
              ),
              content: PanelContent(
                panelContent: _panel(),
                bodyContent: _body(context),
              ),
              onPanelStateChanged: (panelState) {
                if (panelState == PanelState.animating) {
                  setState(() {
                    _expandedHeight = _isSigninPanel ? 0.55 : 0.85;
                  });
                }
              },
            );
          }
        },
      ),
    );
  }

  List<Widget> _panel() {
    return <Widget>[
      _isSigninPanel
          ? Panel(
              title: INSERT_YOUR_DATA,
              page: SigninPageConnected(),
            )
          : Panel(
              title: CREATE_ACCOUNT,
              page: SignupPageConnected(panelController: _panelController),
            ),
    ];
  }

  Widget _body(BuildContext context) {
    return Container(
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
            const Padding(
              padding: EdgeInsets.only(top: 96),
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
                    key: signinButtonKey,
                    child: const Text(
                      SIGNIN_WITH_EMAIL,
                      style: TextStyle(fontSize: 18),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    onPressed: () {
                      setState(() => _isSigninPanel = true);
                      _panelController.expand();
                    },
                  ),
                  const SizedBox(height: 12),
                  RaisedButton(
                    key: googleSigninButtonKey,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Image.asset(
                          'assets/images/google.png',
                          fit: BoxFit.contain,
                          height: 20,
                          width: 20,
                        ),
                        const SizedBox(width: 8),
                        const Text(
                          SIGNIN_WITH_GOOGLE,
                          style: TextStyle(fontSize: 18),
                        ),
                      ],
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    color: Colors.white,
                    onPressed: () => signinCubit.signinWithGoogle(),
                  ),
                  const SizedBox(height: 12),
                  OutlineButton(
                    key: noAccountButtonKey,
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
                    borderSide: const BorderSide(color: Colors.white),
                    highlightedBorderColor: Colors.white,
                    onPressed: () {
                      setState(() => _isSigninPanel = false);
                      _panelController.expand();
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
