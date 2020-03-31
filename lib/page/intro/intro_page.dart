import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:simple_router/simple_router.dart';

import '../../core/routing/route_names.dart';
import '../../widget/select/selects.dart';
import '../pages.dart';

const DEFAULT_OPTION = 'T';

class IntroPage extends StatefulWidget {
  @override
  _IntroPageState createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  String _stateOption = DEFAULT_OPTION;

  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      pages: [
        PageViewModel(
          title: 'Escolha seu estado',
          body:
              '''Nos diga qual estado você deseja para buscarmos politicos neste estado''',
          image: const Center(child: Icon(Icons.android)),
          footer: Column(
            children: <Widget>[
              EstadoSelect(
                initialValue: _stateOption,
                onChange: (sigla) => setState(() => _stateOption = sigla),
              ),
            ],
          ),
        ),
      ],
      done: const Text(
        'Done',
        key: ValueKey('done-btn'),
        style: TextStyle(
          fontWeight: FontWeight.w600,
        ),
      ),
      onDone: () => SimpleRouter.forwardAndReplace(
        PoliticSuggestionPageConnected(_stateOption),
        name: POLITIC_SUGGESTION_PAGE,
      ),
    );
  }
}
