import 'package:flutter/material.dart';
import 'package:smart_select/smart_select.dart';

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
    return SmartSelect<String>.single(
      title: 'Estado',
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
