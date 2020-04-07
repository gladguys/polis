import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:smart_select/smart_select.dart';

import '../../model/models.dart';
import '../../page/theme/main_theme.dart';

class PartidoSelect extends StatefulWidget {
  PartidoSelect(
      {@required this.partidos, this.initialValue, @required this.onChange})
      : assert(partidos != null),
        assert(onChange != null);

  final List<PartidoModel> partidos;
  final String initialValue;
  final SmartSelectOnChange<String> onChange;

  @override
  _PartidoSelectState createState() => _PartidoSelectState();
}

class _PartidoSelectState extends State<PartidoSelect> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 128,
      child: SmartSelect<String>.single(
        title: 'Partido',
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
        modalType: SmartSelectModalType.popupDialog,
        choiceConfig: SmartSelectChoiceConfig(
          style: SmartSelectChoiceStyle(
            activeColor: theme.primaryColor,
            titleStyle: const TextStyle(
              fontSize: 14,
              fontFamily: 'Ubuntu',
            ),
          ),
        ),
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

  List<SmartSelectOption<String>> _getOptions() {
    final partidosSelect = [
      SmartSelectOption<String>(value: 'T', title: 'Todos'),
    ];
    return partidosSelect
      ..addAll(
        widget.partidos.map(
          (partido) => SmartSelectOption<String>(
              value: partido.sigla, title: partido.sigla),
        ),
      );
  }
}
