import 'package:flutter/material.dart';
import 'package:smart_select/smart_select.dart';

import '../../model/models.dart';

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
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(),
      ),
      child: SmartSelect<String>.single(
        dense: true,
        padding: const EdgeInsets.symmetric(horizontal: 12),
        title: 'Partido',
        value: widget.initialValue,
        options: _getOptions(),
        onChange: widget.onChange,
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
