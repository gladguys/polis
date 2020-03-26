import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:simple_router/simple_router.dart';
import 'package:smart_select/smart_select.dart';

import '../../core/routing/route_names.dart';
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
              SmartSelect<String>.single(
                title: 'Estado',
                value: _stateOption,
                options: _getOptions(),
                onChange: (sigla) => setState(() => _stateOption = sigla),
                modalType: SmartSelectModalType.popupDialog,
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

List<SmartSelectOption<String>> _getOptions() {
  return [
    SmartSelectOption<String>(value: 'T', title: 'Todos'),
    SmartSelectOption<String>(value: 'AC', title: 'Acre'),
    SmartSelectOption<String>(value: 'AL', title: 'Alagoas'),
    SmartSelectOption<String>(value: 'AP', title: 'Amapá'),
    SmartSelectOption<String>(value: 'AM', title: 'Amazonas'),
    SmartSelectOption<String>(value: 'BA', title: 'Bahia'),
    SmartSelectOption<String>(value: 'CE', title: 'Ceará'),
    SmartSelectOption<String>(value: 'DF', title: 'Distrito Federal'),
    SmartSelectOption<String>(value: 'ES', title: 'Espírito Santo'),
    SmartSelectOption<String>(value: 'GO', title: 'Goiás'),
    SmartSelectOption<String>(value: 'MA', title: 'Maranhão'),
    SmartSelectOption<String>(value: 'MT', title: 'Mato Grosso'),
    SmartSelectOption<String>(value: 'MS', title: 'Mato Grosso do Sul'),
    SmartSelectOption<String>(value: 'MG', title: 'Minas Gerais'),
    SmartSelectOption<String>(value: 'PA', title: 'Pará'),
    SmartSelectOption<String>(value: 'PB', title: 'Paraíba'),
    SmartSelectOption<String>(value: 'PR', title: 'Paraná'),
    SmartSelectOption<String>(value: 'PE', title: 'Pernambuco'),
    SmartSelectOption<String>(value: 'PI', title: 'Piauí'),
    SmartSelectOption<String>(value: 'RJ', title: 'Rio de Janeiro'),
    SmartSelectOption<String>(value: 'RN', title: 'Rio Grande do Norte'),
    SmartSelectOption<String>(value: 'RS', title: 'Rio Grande do Sul'),
    SmartSelectOption<String>(value: 'RO', title: 'Rondônia'),
    SmartSelectOption<String>(value: 'RR', title: 'Roraima'),
    SmartSelectOption<String>(value: 'SC', title: 'Santa Catarina'),
    SmartSelectOption<String>(value: 'SP', title: 'São Paulo'),
    SmartSelectOption<String>(value: 'SE', title: 'Sergipe'),
    SmartSelectOption<String>(value: 'TO', title: 'Tocantins'),
  ];
}
