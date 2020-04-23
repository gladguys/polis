import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:simple_router/simple_router.dart';

import '../../core/keys.dart';
import '../../core/routing/route_names.dart';
import '../../i18n/i18n.dart';
import '../../widget/select/selects.dart';
import '../pages.dart';
import '../theme/main_theme.dart';

const DEFAULT_OPTION = 'T';

class IntroPage extends StatefulWidget {
  @override
  _IntroPageState createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  String _stateOption = DEFAULT_OPTION;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: IntroductionScreen(
          pages: [
            PageViewModel(
              titleWidget: const Text(
                POLIS,
                style: TextStyle(
                  fontFamily: 'Philosopher',
                  fontSize: 56,
                  fontWeight: FontWeight.bold,
                ),
              ),
              bodyWidget: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  const SizedBox(height: 80),
                  const Text(
                    STATE_MESSAGE,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 24),
                  ),
                  const SizedBox(height: 16),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: EstadoSelect(
                      initialValue: _stateOption,
                      onChange: (sigla) => setState(() => _stateOption = sigla),
                    ),
                  ),
                ],
              ),
            ),
          ],
          done: Text(
            CONFIRM.toUpperCase(),
            key: doneButtonKey,
            style: const TextStyle(
              fontWeight: FontWeight.w600,
            ),
          ),
          dotsDecorator: DotsDecorator(
            activeColor: theme.primaryColor,
          ),
          onDone: () => SimpleRouter.forwardAndReplace(
            PoliticSuggestionPageConnected(_stateOption),
            name: POLITIC_SUGGESTION_PAGE,
          ),
        ),
      ),
    );
  }
}
