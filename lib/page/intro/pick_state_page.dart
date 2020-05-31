import 'package:flutter/material.dart';
import 'package:simple_router/simple_router.dart';

import '../../core/i18n/i18n.dart';
import '../../core/keys.dart';
import '../../core/routing/route_names.dart';
import '../../widget/select/selects.dart';
import '../pages.dart';
import 'intro_base.dart';

const DEFAULT_OPTION = 'T';

class PickStatePage extends StatefulWidget {
  @override
  _PickStatePageState createState() => _PickStatePageState();
}

class _PickStatePageState extends State<PickStatePage> {
  String _stateOption = DEFAULT_OPTION;

  @override
  Widget build(BuildContext context) {
    return IntroBase(
      centerWidget: Column(
        children: <Widget>[
          const Text(
            STATE_MESSAGE,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20),
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
      keyButton: pickStateButtonKey,
      onPressed: () => SimpleRouter.forwardAndReplace(
        PoliticSuggestionPageConnected(_stateOption),
        name: POLITIC_SUGGESTION_PAGE,
      ),
    );
  }
}
