import 'package:flutter/material.dart';
import 'package:smart_select/smart_select.dart';

class PartidoSelect extends StatefulWidget {
  PartidoSelect({this.initialValue, @required this.onChange})
      : assert(onChange != null);

  final String initialValue;
  final SmartSelectOnChange<String> onChange;

  @override
  _PartidoSelectState createState() => _PartidoSelectState();
}

class _PartidoSelectState extends State<PartidoSelect> {
  @override
  Widget build(BuildContext context) {
    return SmartSelect<String>.single(
      title: 'Partido',
      value: widget.initialValue,
      options: _getOptions(),
      onChange: widget.onChange,
      modalType: SmartSelectModalType.popupDialog,
    );
  }
}

List<SmartSelectOption<String>> _getOptions() {
  return [
    SmartSelectOption<String>(value: 'T', title: 'Todos'),
    SmartSelectOption<String>(value: 'PT', title: 'PT'),
    SmartSelectOption<String>(value: 'PMDB', title: 'PMDB'),
  ];
}
