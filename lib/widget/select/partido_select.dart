import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:smart_select/smart_select.dart';

import '../../core/domain/model/models.dart';
import '../../core/i18n/i18n.dart';

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
      width: 150,
      child: SmartSelect<String>.single(
        isTwoLine: true,
        dense: true,
        padding: const EdgeInsets.symmetric(horizontal: 8),
        title: PARTY,
        value: widget.initialValue,
        trailing: FaIcon(
          FontAwesomeIcons.flag,
          size: 18,
          color: Colors.grey[400],
        ),
        options: _getOptions(),
        onChange: widget.onChange,
        modalType: SmartSelectModalType.popupDialog,
        choiceConfig: SmartSelectChoiceConfig(
          style: SmartSelectChoiceStyle(
            activeColor: Theme.of(context).primaryColor,
            inactiveColor: Theme.of(context).brightness == Brightness.light
                ? null
                : Colors.grey[300],
            titleStyle: TextStyle(
              fontSize: 14,
              fontFamily: 'Ubuntu',
              color: Theme.of(context).brightness == Brightness.light
                  ? Colors.grey[600]
                  : Colors.grey[300],
            ),
          ),
        ),
        modalConfig: SmartSelectModalConfig(
          style: SmartSelectModalStyle(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          headerStyle: SmartSelectModalHeaderStyle(
            backgroundColor: Theme.of(context).brightness == Brightness.light
                ? null
                : Colors.grey[800],
            textStyle: TextStyle(
              color: Theme.of(context).brightness == Brightness.light
                  ? Colors.black
                  : Colors.grey[300],
            ),
            shape: const RoundedRectangleBorder(
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

    final partidos = widget.partidos;
    partidos.sort((p1, p2) => p1.sigla.compareTo(p2.sigla));
    return partidosSelect
      ..addAll(
        partidos.map((partido) => SmartSelectOption<String>(
            value: partido.sigla, title: partido.sigla)),
      );
  }
}
