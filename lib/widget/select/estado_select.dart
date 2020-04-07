import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:smart_select/smart_select.dart';

import '../../page/theme/main_theme.dart';

class EstadoSelect extends StatefulWidget {
  EstadoSelect({this.initialValue, @required this.onChange})
      : assert(onChange != null);

  final String initialValue;
  final SmartSelectOnChange<String> onChange;

  @override
  _EstadoSelectState createState() => _EstadoSelectState();
}

class _EstadoSelectState extends State<EstadoSelect> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180,
      child: SmartSelect<String>.single(
        title: 'Estado',
        isTwoLine: true,
        dense: true,
        padding: const EdgeInsets.symmetric(horizontal: 8),
        trailing: FaIcon(
          FontAwesomeIcons.chevronCircleDown,
          size: 18,
          color: Colors.grey[400],
        ),
        value: widget.initialValue,
        options: _getOptions(),
        onChange: widget.onChange,
        choiceConfig: SmartSelectChoiceConfig(
          style: SmartSelectChoiceStyle(
            activeColor: theme.primaryColor,
            titleStyle: const TextStyle(
              fontSize: 14,
              fontFamily: 'Ubuntu',
            ),
          ),
        ),
        modalType: SmartSelectModalType.popupDialog,
        modalConfig: SmartSelectModalConfig(
          style: SmartSelectModalStyle(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          headerStyle: const SmartSelectModalHeaderStyle(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
            ),
          ),
        ),
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
