import 'package:flutter/material.dart';
import '../../core/keys.dart';
import 'package:simple_router/simple_router.dart';

import '../../extension/media_query_extensions.dart';
import '../../core/routing/route_names.dart';
import '../../i18n/i18n.dart';
import '../../widget/select/selects.dart';
import '../pages.dart';

const DEFAULT_OPTION = 'T';

class PickStatePage extends StatefulWidget {
  @override
  _PickStatePageState createState() => _PickStatePageState();
}

class _PickStatePageState extends State<PickStatePage> {
  String _stateOption = DEFAULT_OPTION;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: context.screenWidth,
        child: Padding(
            padding: const EdgeInsets.all(38),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                const Text(
                  POLIS,
                  style: TextStyle(
                    fontFamily: 'Philosopher',
                    fontSize: 56,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 22),
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
                const SizedBox(height: 16),
                RaisedButton(
                  child: Text(
                    PICK.toUpperCase(),
                    key: pickStateButtonKey,
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 13,
                    ),
                  ),
                  color: Colors.amber,
                  onPressed: () => SimpleRouter.forwardAndReplace(
                    PoliticSuggestionPageConnected(_stateOption),
                    name: POLITIC_SUGGESTION_PAGE,
                  ),
                ),
              ],
            ),),
      ),
    );
  }
}
