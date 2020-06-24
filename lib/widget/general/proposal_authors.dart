import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../core/i18n/i18n.dart';
import '../../core/keys.dart';
import '../../page/theme/main_theme.dart';
import 'label_value.dart';

class ProposalAuthors extends StatefulWidget {
  ProposalAuthors(this.nomesAutores);

  final List<String> nomesAutores;

  @override
  _ProposalAuthorsState createState() => _ProposalAuthorsState();
}

class _ProposalAuthorsState extends State<ProposalAuthors> {
  List<String> get nomesAutores => widget.nomesAutores;

  bool mostrarTodos = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => setState(() => mostrarTodos = !mostrarTodos),
      key: proposalAuthorsVisibilityKey,
      child: mostrarTodos
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const SizedBox(width: double.maxFinite),
                _buildLabelValue(),
                const SizedBox(height: 2),
                Align(
                  alignment: Alignment.bottomRight,
                  child: _buildIndicatorSeeMore(),
                ),
              ],
            )
          : Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Expanded(
                  child: _buildLabelValue(),
                ),
                _buildIndicatorSeeMore(),
              ],
            ),
    );
  }

  Widget _buildLabelValue() {
    return LabelValue(
      label: AUTHORS,
      value: _getAuthorsNamesFormatted(nomesAutores, ''),
      emptyValue: NOT_INFORMED,
      maxLines: mostrarTodos ? null : 2,
    );
  }

  Widget _buildIndicatorSeeMore() {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 2,
        horizontal: 10,
      ),
      decoration: BoxDecoration(
        border: Border.all(color: theme.primaryColorLight),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          FaIcon(
            mostrarTodos
                ? FontAwesomeIcons.angleUp
                : FontAwesomeIcons.angleDown,
            size: 12,
          ),
          const SizedBox(width: 4),
          Text(
            mostrarTodos ? SEE_LESS.toUpperCase() : SEE_MORE.toUpperCase(),
            style: const TextStyle(
              fontSize: 9,
              height: 1.1,
            ),
          ),
        ],
      ),
    );
  }

  String _getAuthorsNamesFormatted(List<String> authors, String replacement) {
    if (authors.isNotEmpty) {
      final allAuthors = authors.fold('', (nome, nomes) => '$nomes, $nome');
      final lastComma = allAuthors.lastIndexOf(',');
      return allAuthors.replaceRange(lastComma, lastComma + 1, replacement);
    }
    return '';
  }
}
